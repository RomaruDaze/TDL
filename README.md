# TDL : A Simple Todo List App

A simple and intuitive Todo List application built with Flutter. This app allows users to manage their tasks efficiently.

## Table of Contents
- [Clone the Repository](#clone-the-repository)
- [Edit the App](#edit-the-app)
- [Change the App Icon](#change-the-app-icon)
- [Run or Debug the App](#run-or-debug-the-app)
- [Install Dependencies](#install-dependencies)

## Clone the Repository

To clone the repository, run the following command in your terminal:
```
git clone https://github.com/yourusername/todo-list-app.git
```


Replace `yourusername` with your GitHub username.

## Edit the App

You can edit the app by opening the project in your preferred IDE (e.g., Visual Studio Code, Android Studio). Navigate to the `lib` folder to modify the Dart files and customize the app's functionality.

## Change the App Icon

To change the app icon, you can follow these steps:

1. **Manually Changing Icons:**
    - Go to [AppIcon.co](https://appicon.co/) and upload your desired icon image. Select both iPhone and Android options, then click on "Generate."
    - Download the generated zip file, which contains the necessary icon sizes for both platforms.
    - For Android, navigate to `android/app/src/main/res` in your project, delete the existing `mipmap` folders, and replace them with the new `mipmap` folders from the downloaded zip.
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

## Run or Debug the App

To run or debug the app, use the following command in your terminal:
```
flutter run
```


Make sure you have an emulator running or a physical device connected.

## Install Dependencies

Before running the app, ensure you have all the necessary dependencies installed. Run the following command in the terminal:

```
flutter pub get
```


This command will fetch all the required packages listed in the `pubspec.yaml` file.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
