#!/bin/bash

# Check if feature name is provided
if [ -z "$1" ]
then
    echo "Please provide a feature name"
    echo "Usage: ./create_feature.sh feature_name"
    exit 1
fi

# Convert feature name to PascalCase
# First, convert to lowercase and replace underscores with spaces
FEATURE_NAME=$(echo "$1" | tr '[:upper:]' '[:lower:]' | sed 's/_/ /g')
# Then capitalize first letter of each word and remove spaces
FEATURE_NAME=$(echo "$FEATURE_NAME" | awk '{for(i=1;i<=NF;i++)sub(/./,toupper(substr($i,1,1)),$i)}1' | tr -d ' ')

# Convert to uppercase for route constant
ROUTE_NAME=$(echo "$1" | tr '[:lower:]' '[:upper:]' | sed 's/_/ /g' | tr -d ' ')

# Create feature directory
mkdir -p "lib/src/screens/$1"

# Create screen file
cat > "lib/src/screens/$1/${1}_screen.dart" << EOL
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:startup_app/src/screens/$1/${1}_controller.dart';

class ${FEATURE_NAME}Screen extends GetView<${FEATURE_NAME}Controller> {
  const ${FEATURE_NAME}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${FEATURE_NAME}'),
      ),
      body: Center(
        child: Text('${FEATURE_NAME} Screen'),
      ),
    );
  }
}
EOL

# Create controller file
cat > "lib/src/screens/$1/${1}_controller.dart" << EOL
import 'package:get/get.dart';

class ${FEATURE_NAME}Controller extends GetxController {
  // Add your controller logic here
}
EOL

# Create binding file
cat > "lib/src/screens/$1/${1}_binding.dart" << EOL
import 'package:get/get.dart';
import 'package:startup_app/src/screens/$1/${1}_controller.dart';

class ${FEATURE_NAME}Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<${FEATURE_NAME}Controller>(
      () => ${FEATURE_NAME}Controller(),
    );
  }
}
EOL

# Add route to app_pages.dart
sed -i '' "/abstract class Routes {/a\\
  static const ${ROUTE_NAME} = '/${1}';" lib/routes/app_pages.dart

# Add imports to app_pages.dart
sed -i '' "/import 'package:startup_app\/src\/screens\/splash\/splash_screen.dart';/a\\
import 'package:startup_app\/src\/screens\/$1\/${1}_screen.dart';\\
import 'package:startup_app\/src\/screens\/$1\/${1}_binding.dart';" lib/routes/app_pages.dart

# Add GetPage to app_pages.dart
sed -i '' "/GetPage(\
      name: Routes.REGISTER,\
      page: RegisterScreen.new,\
      binding: RegisterBinding(),\
      transition: Transition.fade,\
    ),/a\\
    GetPage(\
      name: Routes.${ROUTE_NAME},\
      page: ${FEATURE_NAME}Screen.new,\
      binding: ${FEATURE_NAME}Binding(),\
      transition: Transition.fade,\
    )," lib/routes/app_pages.dart

echo "Created feature files for $1:"
echo "- lib/src/screens/$1/${1}_screen.dart"
echo "- lib/src/screens/$1/${1}_controller.dart"
echo "- lib/src/screens/$1/${1}_binding.dart"
echo "Added routes to:"
echo "- lib/routes/app_pages.dart" 