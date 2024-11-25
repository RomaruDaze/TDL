[![en](https://img.shields.io/badge/lang-en-blue.svg)](https://github.com/RomaruDaze/TDL/blob/main/README.md) [![jp](https://img.shields.io/badge/lang-jp-red.svg)](https://github.com/RomaruDaze/TDL/blob/main/README.jp.md) [![cn](https://img.shields.io/badge/lang-cn-green.svg)](https://github.com/RomaruDaze/TDL/blob/main/README.cn.md) [![es](https://img.shields.io/badge/lang-es-yellow.svg)](https://github.com/RomaruDaze/TDL/blob/main/README.es.md)

# TDL: A Simple Todo List App

Welcome to TDL, a simple and intuitive Todo List application built with Flutter. This app allows users to efficiently manage their tasks, helping you stay organized and productive.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Getting Started](#getting-started)
- [Clone the Repository](#clone-the-repository)
- [Edit the App](#edit-the-app)
- [Change the App Icon](#change-the-app-icon)
- [Run or Debug the App](#run-or-debug-the-app)
- [Install Dependencies](#install-dependencies)
- [Install on Mobile](#install-on-mobile)
- [License](#license)

## Overview

TDL is designed to provide a user-friendly interface for managing tasks. You can add, edit, delete, and categorize your tasks, making it easier to keep track of your to-do list.

## Features

- **Add Tasks**: Quickly add new tasks to your list.
- **Edit Tasks**: Modify existing tasks with ease.
- **Delete Tasks**: Remove tasks that are no longer needed.
- **Task Status**: Mark tasks as completed or pending.
- **Filter and Sort**: View tasks based on their status and sort them by date.

## Getting Started

To get started with TDL, follow the instructions below to set up the project on your local machine. If you're new to Flutter, please refer to the [Flutter installation guide](https://flutter.dev/docs/get-started/install) for detailed setup instructions.

### Clone the Repository

To clone the repository, run the following command in your terminal:

```bash
git clone https://github.com/yourusername/TDL.git
```

Replace `yourusername` with your GitHub username.

### Edit the App

You can edit the app by opening the project in your preferred IDE (e.g., Visual Studio Code, Android Studio). Navigate to the `lib` folder to modify the Dart files and customize the app's functionality.

### Change the App Icon

To change the app icon, you can follow these steps:

1. **Manually Changing Icons:**

   - Go to [AppIcon.co](https://appicon.co/) and upload your desired icon image. Select both iPhone and Android options, then click on "Generate."
   - Download the generated zip file, which contains the necessary icon sizes for both platforms.
   - For Android, navigate to `android/app/src/main/res`, delete the existing `mipmap` folders, and replace them with the new `mipmap` folders from the downloaded zip.
   - For iOS, navigate to `ios/Runner/Assets.xcassets`, delete the existing `Assets.xcassets` folder, and replace it with the new `Assets.xcassets` folder from the downloaded zip.

2. **Using Flutter Launcher Icons Package:**
   - Open the `pubspec.yaml` file and add the following dependency under `dev_dependencies`:
     ```yaml
     flutter_launcher_icons: "^0.13.0"
     ```
   - Create an `assets` folder, then create an `icon` folder inside it, and add your `icon.png` file.
   - Run the following commands in the terminal:
     ```bash
     flutter pub get
     flutter pub run flutter_launcher_icons
     ```

### Run or Debug the App

To run or debug the app, use the following command in your terminal:

```bash
flutter run
```

Make sure you have an emulator running or a physical device connected.

### Install Dependencies

Before running the app, ensure you have all the necessary dependencies installed. Run the following command in the terminal:

```bash
flutter pub get
```

This command will fetch all the required packages listed in the `pubspec.yaml` file.

### Install on Mobile

To install the app on your mobile device, follow these steps:

#### For Android:

1. Connect your Android device to your computer via USB.
2. Ensure USB debugging is enabled on your device.
3. Run the following command in your terminal:
   ```bash
   flutter install
   ```
   This will build the app and install it directly on your connected device.

#### For iOS:

1. Open the project in Xcode by navigating to the `ios` folder and opening the `Runner.xcworkspace` file.
2. Connect your iOS device to your computer.
3. Select your device in Xcode and click the "Run" button (or use the shortcut `Cmd + R`) to build and install the app on your device.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
