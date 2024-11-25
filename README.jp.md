[![en](https://img.shields.io/badge/lang-en-blue.svg)](https://github.com/RomaruDaze/TDL/blob/main/README.md) [![jp](https://img.shields.io/badge/lang-jp-red.svg)](https://github.com/RomaruDaze/TDL/blob/main/README.jp.md) [![cn](https://img.shields.io/badge/lang-cn-green.svg)](https://github.com/RomaruDaze/TDL/blob/main/README.cn.md) [![es](https://img.shields.io/badge/lang-es-yellow.svg)](https://github.com/RomaruDaze/TDL/blob/main/README.es.md)

# TDL: シンプルな Todo リストアプリ

TDL へようこそ。これは Flutter で構築されたシンプルで直感的な Todo リストアプリです。このアプリは、ユーザーが効率的にタスクを管理できるようにし、整理整頓と生産性を向上させる手助けをします。

## 目次

- [概要](#概要)
- [機能](#機能)
- [始め方](#始め方)
- [リポジトリのクローン](#リポジトリのクローン)
- [アプリの編集](#アプリの編集)
- [アプリアイコンの変更](#アプリアイコンの変更)
- [アプリの実行またはデバッグ](#アプリの実行またはデバッグ)
- [依存関係のインストール](#依存関係のインストール)
- [モバイルへのインストール](#モバイルへのインストール)
- [ライセンス](#ライセンス)

## 概要

TDL は、タスクを管理するためのユーザーフレンドリーなインターフェースを提供するように設計されています。タスクを追加、編集、削除、カテゴリ分けすることができ、Todo リストを簡単に追跡できます。

## 機能

- **タスクの追加**: 新しいタスクをリストに迅速に追加できます。
- **タスクの編集**: 既存のタスクを簡単に修正できます。
- **タスクの削除**: もはや必要のないタスクを削除できます。
- **タスクの状態**: タスクを完了または保留としてマークできます。
- **フィルタリングとソート**: タスクの状態に基づいて表示し、日付でソートできます。

## 始め方

TDL を始めるには、以下の手順に従ってローカルマシンにプロジェクトをセットアップしてください。Flutter が初めての方は、[Flutter インストールガイド](https://flutter.dev/docs/get-started/install)を参照して詳細なセットアップ手順を確認してください。

### リポジトリのクローン

リポジトリをクローンするには、ターミナルで以下のコマンドを実行します：

```bash
git clone https://github.com/yourusername/TDL.git
```

`yourusername`をあなたの GitHub ユーザー名に置き換えてください。

### アプリの編集

お好みの IDE（例：Visual Studio Code、Android Studio）でプロジェクトを開くことでアプリを編集できます。`lib`フォルダに移動して Dart ファイルを修正し、アプリの機能をカスタマイズしてください。

### アプリアイコンの変更

アプリアイコンを変更するには、以下の手順に従ってください：

1. **アイコンの手動変更:**

   - [AppIcon.co](https://appicon.co/)にアクセスし、希望のアイコン画像をアップロードします。iPhone と Android のオプションを選択し、「生成」をクリックします。
   - 生成された zip ファイルをダウンロードします。このファイルには、両方のプラットフォームに必要なアイコンサイズが含まれています。
   - Android の場合、`android/app/src/main/res`に移動し、既存の`mipmap`フォルダを削除し、ダウンロードした zip から新しい`mipmap`フォルダに置き換えます。
   - iOS の場合、`ios/Runner/Assets.xcassets`に移動し、既存の`Assets.xcassets`フォルダを削除し、ダウンロードした zip から新しい`Assets.xcassets`フォルダに置き換えます。

2. **Flutter Launcher Icons パッケージを使用する:**
   - `pubspec.yaml`ファイルを開き、`dev_dependencies`の下に以下の依存関係を追加します：
     ```yaml
     flutter_launcher_icons: "^0.13.0"
     ```
   - `assets`フォルダを作成し、その中に`icon`フォルダを作成し、`icon.png`ファイルを追加します。
   - ターミナルで以下のコマンドを実行します：
     ```bash
     flutter pub get
     flutter pub run flutter_launcher_icons
     ```

### アプリの実行またはデバッグ

アプリを実行またはデバッグするには、ターミナルで以下のコマンドを使用します：

```bash
flutter run
```

エミュレーターが実行中であるか、物理デバイスが接続されていることを確認してください。

### 依存関係のインストール

アプリを実行する前に、必要な依存関係がすべてインストールされていることを確認してください。ターミナルで以下のコマンドを実行します：

```bash
flutter pub get
```

このコマンドは、`pubspec.yaml`ファイルにリストされているすべての必要なパッケージを取得します。

### モバイルへのインストール

アプリをモバイルデバイスにインストールするには、以下の手順に従ってください：

#### Android の場合：

1. USB 経由で Android デバイスをコンピュータに接続します。
2. デバイスで USB デバッグが有効になっていることを確認します。
3. ターミナルで以下のコマンドを実行します：
   ```bash
   flutter install
   ```
   これにより、アプリがビルドされ、接続されたデバイスに直接インストールされます。

#### iOS の場合：

1. `ios`フォルダに移動し、`Runner.xcworkspace`ファイルを開いて Xcode でプロジェクトを開きます。
2. iOS デバイスをコンピュータに接続します。
3. Xcode でデバイスを選択し、「実行」ボタンをクリックするか（またはショートカット`Cmd + R`を使用して）、アプリをビルドしてデバイスにインストールします。

## ライセンス

このプロジェクトは MIT ライセンスの下でライセンスされています - 詳細は[LICENSE](LICENSE)ファイルを参照してください。
