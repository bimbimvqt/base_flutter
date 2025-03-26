import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:startup_app/models/message.dart';
import 'package:startup_app/services/germini_api_servive.dart';
import 'dart:io';

class ChatController extends GetxController {
  final GerminiApiServive germiniApiServive = GerminiApiServive();
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  RxList<Message> responseText = <Message>[].obs;
  RxString messageText = ''.obs;
  ValueNotifier<bool> isTyping = ValueNotifier<bool>(false);
  RxBool isLoading = false.obs;
  RxString imagePath = ''.obs;

  void removeSelectedImage() {
    imagePath.value = '';
    // Remove the last message if it's an image message
    if (responseText.isNotEmpty && responseText.last.imagePath != null) {
      responseText.removeLast();
    }
  }

  Future<void> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        imagePath.value = image.path;
        scrollToBottom();
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
      Get.snackbar(
        'Error',
        'Failed to pick image. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> sendRequest() async {
    final text = messageController.text;
    if (text.isEmpty && imagePath.value.isEmpty) return;

    final userMsgId = DateTime.now().millisecondsSinceEpoch;
    final userMsg = text;

    // Add user message
    responseText.add(Message(
      id: userMsgId,
      content: userMsg,
      isUser: true,
      timestamp: DateTime.now(),
      imagePath: imagePath.value.isNotEmpty ? imagePath.value : null,
    ));

    messageController.clear();
    scrollToBottom();

    if (imagePath.value.isNotEmpty) {
      await sendImageRequest(imagePath.value, userMsg);
      imagePath.value = '';
    } else {
      await sendTextRequest(text);
    }
    messageText.value = '';
  }

  Future<void> sendTextRequest(String text) async {
    if (text.isEmpty) return;
    isLoading.value = true;

    final userMsgId = DateTime.now().millisecondsSinceEpoch;

    try {
      final model = GenerativeModel(
        model: 'gemini-2.0-flash',
        apiKey: GerminiApiServive().apiKey,
      );

      final response = model.generateContentStream([Content.text(text)]);
      final responseMsgId = userMsgId + 1;

      // Add empty AI message
      final aiMessage = Message(
        id: responseMsgId,
        content: "",
        isUser: false,
        timestamp: DateTime.now(),
      );
      responseText.add(aiMessage);

      response.listen((event) {
        if (event.text != null) {
          final index = responseText.indexWhere((element) => element.id == responseMsgId);
          if (index != -1) {
            final currentText = responseText[index].content;
            responseText[index] = Message(
              id: responseMsgId,
              content: currentText + event.text!,
              isUser: false,
              timestamp: DateTime.now(),
            );
            scrollToBottom();
          }
        }
      });
    } catch (e) {
      debugPrint('Error generating text response: $e');
      Get.snackbar(
        'Error',
        'Failed to generate response. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> sendImageRequest(String imagePath, String prompt) async {
    isLoading.value = true;
    final userMsgId = DateTime.now().millisecondsSinceEpoch;

    try {
      final model = GenerativeModel(
        model: 'gemini-2.0-flash',
        apiKey: GerminiApiServive().apiKey,
      );

      // Read image file
      final imageFile = File(imagePath);
      final imageBytes = await imageFile.readAsBytes();

      // Add both image and text content
      final contents = [
        Content.multi([
          DataPart('image/jpeg', imageBytes),
          TextPart(prompt),
        ])
      ];

      final response = model.generateContentStream(contents);
      final responseMsgId = userMsgId + 1;

      // Add empty AI message
      final aiMessage = Message(
        id: responseMsgId,
        content: "",
        isUser: false,
        timestamp: DateTime.now(),
      );
      responseText.add(aiMessage);

      response.listen((event) {
        if (event.text != null) {
          final index = responseText.indexWhere((element) => element.id == responseMsgId);
          if (index != -1) {
            final currentText = responseText[index].content;
            responseText[index] = Message(
              id: responseMsgId,
              content: currentText + event.text!,
              isUser: false,
              timestamp: DateTime.now(),
            );
            scrollToBottom();
          }
        }
      });
    } catch (e) {
      debugPrint('Error generating image response: $e');
      Get.snackbar(
        'Error',
        'Failed to analyze image. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void scrollToBottom() {
    if (!scrollController.hasClients) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void onInit() {
    super.onInit();
    ever(responseText, (_) {
      if (responseText.isNotEmpty) {
        scrollToBottom();
      }
    });
  }
}
