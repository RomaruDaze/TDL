[![en](https://img.shields.io/badge/lang-en-blue.svg)](https://github.com/RomaruDaze/TDL/blob/main/README.md) [![jp](https://img.shields.io/badge/lang-jp-red.svg)](https://github.com/RomaruDaze/TDL/blob/main/README_jp.md) [![cn](https://img.shields.io/badge/lang-cn-green.svg)](https://github.com/RomaruDaze/TDL/blob/main/README_cn.md) [![es](https://img.shields.io/badge/lang-es-yellow.svg)](https://github.com/RomaruDaze/TDL/blob/main/README_es.md)
# TDL：一个简单的待办事项应用

欢迎使用 TDL，这是一个简单直观的待办事项应用程序，使用 Flutter 构建。该应用程序允许用户高效管理任务，帮助您保持组织和高效。

## 目录

- [概述](#概述)
- [功能](#功能)
- [开始使用](#开始使用)
- [克隆仓库](#克隆仓库)
- [编辑应用](#编辑应用)
- [更改应用图标](#更改应用图标)
- [运行或调试应用](#运行或调试应用)
- [安装依赖](#安装依赖)
- [在移动设备上安装](#在移动设备上安装)
- [许可证](#许可证)

## 概述

TDL 旨在提供一个用户友好的界面来管理任务。您可以添加、编辑、删除和分类任务，使跟踪待办事项变得更加容易。

## 功能

- **添加任务**：快速将新任务添加到您的列表中。
- **编辑任务**：轻松修改现有任务。
- **删除任务**：删除不再需要的任务。
- **任务状态**：将任务标记为已完成或待处理。
- **筛选和排序**：根据状态查看任务并按日期排序。

## 开始使用

要开始使用 TDL，请按照以下说明在本地计算机上设置项目。如果您是 Flutter 新手，请参考 [Flutter 安装指南](https://flutter.dev/docs/get-started/install) 以获取详细的设置说明。

### 克隆仓库

要克隆仓库，请在终端中运行以下命令：
```bash
git clone https://github.com/yourusername/todo-list-app.git
```
将 `yourusername` 替换为您的 GitHub 用户名。

### 编辑应用

您可以通过在您喜欢的 IDE（例如 Visual Studio Code、Android Studio）中打开项目来编辑应用。导航到 `lib` 文件夹以修改 Dart 文件并自定义应用的功能。

### 更改应用图标

要更改应用图标，您可以按照以下步骤操作：

1. **手动更改图标：**

   - 访问 [AppIcon.co](https://appicon.co/) 并上传您想要的图标图像。选择 iPhone 和 Android 选项，然后单击“生成”。
   - 下载生成的 zip 文件，其中包含两个平台所需的图标大小。
   - 对于 Android，导航到 `android/app/src/main/res`，删除现有的 `mipmap` 文件夹，并用下载的 zip 中的新 `mipmap` 文件夹替换它们。
   - 对于 iOS，导航到 `ios/Runner/Assets.xcassets`，删除现有的 `Assets.xcassets` 文件夹，并用下载的 zip 中的新 `Assets.xcassets` 文件夹替换它。

2. **使用 Flutter Launcher Icons 包：**
   - 打开 `pubspec.yaml` 文件，并在 `dev_dependencies` 下添加以下依赖：
     ```yaml
     flutter_launcher_icons: "^0.13.0"
     ```
   - 创建一个 `assets` 文件夹，然后在其中创建一个 `icon` 文件夹，并添加您的 `icon.png` 文件。
   - 在终端中运行以下命令：
     ```bash
     flutter pub get
     flutter pub run flutter_launcher_icons
     ```

### 运行或调试应用

要运行或调试应用，请在终端中使用以下命令：
```bash
flutter run
```
确保您有一个模拟器正在运行或连接了物理设备。

### 安装依赖

在运行应用之前，请确保安装了所有必要的依赖。在终端中运行以下命令：
```bash
flutter pub get
```
此命令将获取 `pubspec.yaml` 文件中列出的所有所需包。

### 在移动设备上安装

要在移动设备上安装应用，请按照以下步骤操作：

#### 对于 Android：

1. 通过 USB 将 Android 设备连接到计算机。
2. 确保在设备上启用 USB 调试。
3. 在终端中运行以下命令：
   ```bash
   flutter install
   ```
   这将构建应用并直接安装到连接的设备上。

#### 对于 iOS：

1. 通过导航到 `ios` 文件夹并打开 `Runner.xcworkspace` 文件，在 Xcode 中打开项目。
2. 将 iOS 设备连接到计算机。
3. 在 Xcode 中选择您的设备，然后单击“运行”按钮（或使用快捷键 `Cmd + R`）以构建并安装应用到您的设备上。

## 许可证

该项目根据 MIT 许可证进行许可 - 详见 [LICENSE](LICENSE) 文件。
