#!/bin/bash

echo "🔧 Setting up Flutter flavors for Android & iOS..."

# Define flavor names
FLAVORS=("dev" "staging" "prod")

# Create entry point files for each flavor
mkdir -p lib/flavors
for FLAVOR in "${FLAVORS[@]}"
do
    FILE="lib/main_$FLAVOR.dart"
    if [ ! -f "$FILE" ]; then
        cat > "$FILE" <<EOL
import 'package:flutter/material.dart';
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.$FLAVOR;
  runApp(MyApp());
}
EOL
        echo "✅ Created $FILE"
    else
        echo "⚠️ $FILE already exists"
    fi
done

# Create the flavors.dart file
FLAVORS_DART="lib/flavors.dart"
if [ ! -f "$FLAVORS_DART" ]; then
    cat > "$FLAVORS_DART" <<EOL
enum Flavor {
  dev,
  staging,
  prod
}

class F {
  static Flavor? appFlavor;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return "App Dev";
      case Flavor.staging:
        return "App Staging";
      case Flavor.prod:
        return "App";
      default:
        return "App";
    }
  }

  static String get apiBaseUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return "https://api.dev.example.com";
      case Flavor.staging:
        return "https://api.staging.example.com";
      case Flavor.prod:
        return "https://api.example.com";
      default:
        return "https://api.example.com";
    }
  }
}
EOL
    echo "✅ Created lib/flavors.dart"
else
    echo "⚠️ lib/flavors.dart already exists"
fi

# --- Android Setup ---
echo "🔧 Configuring Android flavors..."

ANDROID_GRADLE="android/app/build.gradle"
FLAVOR_CONFIG=$(cat <<EOL
flavorDimensions "flavor"
productFlavors {
    dev {
        dimension "flavor"
        applicationIdSuffix ".dev"
        versionNameSuffix "-dev"
    }
    staging {
        dimension "flavor"
        applicationIdSuffix ".staging"
        versionNameSuffix "-staging"
    }
    prod {
        dimension "flavor"
    }
}
EOL
)

# Inject flavor configuration into build.gradle
if grep -q 'flavorDimensions "flavor"' "$ANDROID_GRADLE"; then
    echo "⚠️ Android flavors already set up in build.gradle"
else
    sed -i '' "/defaultConfig {/a\\
    $FLAVOR_CONFIG
    " "$ANDROID_GRADLE"
    echo "✅ Updated $ANDROID_GRADLE with flavor configurations"
fi

# --- iOS Setup ---
echo "🔧 Configuring iOS flavors..."

IOS_XCCONFIG_PATH="ios/Runner/Configs"
mkdir -p "$IOS_XCCONFIG_PATH"

for FLAVOR in "${FLAVORS[@]}"
do
    XCCONFIG_FILE="$IOS_XCCONFIG_PATH/$FLAVOR.xcconfig"
    if [ ! -f "$XCCONFIG_FILE" ]; then
        cat > "$XCCONFIG_FILE" <<EOL
#include "Common.xcconfig"
APP_ENV=$FLAVOR
EOL
        echo "✅ Created $XCCONFIG_FILE"
    else
        echo "⚠️ $XCCONFIG_FILE already exists"
    fi
done

COMMON_XCCONFIG="$IOS_XCCONFIG_PATH/Common.xcconfig"
if [ ! -f "$COMMON_XCCONFIG" ]; then
    cat > "$COMMON_XCCONFIG" <<EOL
APP_NAME = MyApp
EOL
    echo "✅ Created $COMMON_XCCONFIG"
fi

# Update Xcode project
echo "⚡️ Please manually configure Xcode Schemes in Xcode (Product > Scheme > Manage Schemes)"

echo "✅ Flutter flavors setup completed successfully! 🎉"