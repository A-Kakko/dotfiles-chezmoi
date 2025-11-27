# dotfiles-chezmoi

[chezmoi](https://www.chezmoi.io/)で管理している個人用dotfilesです。

## 含まれる設定

- シェル設定 (bash, zsh, fish)
- ターミナルエミュレータ (Alacritty, Kitty, Ghostty, Zellij)
- エディタ (Neovim, VSCode, Zed)
- ウィンドウマネージャ (Hyprland)
- ステータスバー (Waybar)
- ファイルマネージャ (Yazi)
- その他多数...

## セットアップ方法

### 初回セットアップ

```bash
# chezmoiをインストール
# Arch Linuxの場合:
yay -S chezmoi

# dotfilesをクローンして一括適用
chezmoi init --apply https://github.com/A-Kakko/dotfiles-chezmoi.git
```

これで以下が自動的に実行されます：
1. リポジトリを `~/.local/share/chezmoi` にクローン
2. すべての設定をホームディレクトリに適用

### 手動セットアップ（変更内容を確認してから適用）

```bash
# リポジトリをクローン
chezmoi init https://github.com/A-Kakko/dotfiles-chezmoi.git

# 何が変更されるか確認
chezmoi diff

# 変更を適用
chezmoi apply
```

## 日常のワークフロー

### 設定ファイルの編集

**推奨方法: chezmoi経由で編集**

```bash
# chezmoiを通してファイルを編集
chezmoi edit ~/.bashrc

# 変更内容を確認
chezmoi diff

# ホームディレクトリに変更を適用
chezmoi apply
```

**代替方法: 直接編集**

```bash
# ファイルを直接編集
vim ~/.bashrc

# chezmoiに反映
chezmoi add ~/.bashrc
```

### 変更をコミット

```bash
# chezmoiのソースディレクトリに移動
cd ~/.local/share/chezmoi

# 変更を確認
git status

# 変更をコミット
git add .
git commit -m "設定を更新"

# GitHubにプッシュ
git push
```

### リモートから更新を取得

```bash
# 最新の変更を取得して適用
chezmoi update

# または手動で
cd ~/.local/share/chezmoi
git pull
chezmoi apply
```

## ファイル名の命名規則

chezmoiは特殊なプレフィックスを使ってファイルの属性を管理します：

- `dot_` → `.` (ドットファイル)
  - 例: `dot_bashrc` → `~/.bashrc`

- `private_` → パーミッション 600
  - 例: `private_dot_ssh` → `~/.ssh` (600)

- `executable_` → 実行可能 (755)
  - 例: `executable_script.sh` → `~/script.sh` (実行可能)

- `symlink_` → シンボリックリンク
  - 例: `symlink_dot_vimrc` → `~/.vimrc` (シンボリックリンク)

- `readonly_` → 読み取り専用 (444)

### プレフィックスの組み合わせ

```bash
private_executable_dot_config/script.sh
→ ~/.config/script.sh (プライベート + 実行可能)
```

### ファイル名の変更

ファイルの属性を変更する場合は、gitでリネームします：

```bash
cd ~/.local/share/chezmoi

# ファイルをプライベートにする
git mv dot_bashrc private_dot_bashrc

# ファイルを実行可能にする
git mv dot_config/script.sh executable_dot_config/script.sh

# 変更を適用
chezmoi apply

# コミット
git commit -m "ファイルのパーミッションを更新"
```

## 便利なコマンド

```bash
# 何が変更されるか確認
chezmoi diff

# chezmoiの状態を確認
chezmoi status

# ファイルをchezmoi管理から外す
chezmoi forget ~/.bashrc

# 新しいファイルをchezmoiに追加
chezmoi add ~/.newconfig

# chezmoiソースディレクトリに移動
chezmoi cd
```

## ディレクトリ構造

```
~/.local/share/chezmoi/
├── README.md
├── dot_bashrc
├── dot_bash_profile
├── dot_zshrc
├── dot_tmux.conf
├── dot_config/
│   ├── fish/
│   ├── nvim/
│   ├── hypr/
│   ├── waybar/
│   └── ...
└── .git/
```

## Tips

### 機密情報の管理

SSHキーやAPIトークンなどの機密ファイルは `.chezmoiignore` で除外します：

```bash
echo ".ssh/id_rsa" >> ~/.local/share/chezmoi/.chezmoiignore
```

### テンプレートの使用

マシン固有の設定にはchezmoiのテンプレート機能が使えます：

```bash
# テンプレートとして追加
chezmoi add --template ~/.gitconfig
```

詳細は[chezmoiドキュメント](https://www.chezmoi.io/user-guide/templating/)を参照してください。

## 参考リンク

- [chezmoi公式ドキュメント](https://www.chezmoi.io/)
- [chezmoiクイックスタート](https://www.chezmoi.io/quick-start/)
- [chezmoiユーザーガイド](https://www.chezmoi.io/user-guide/command-overview/)

## ライセンス

このリポジトリは参考用に公開していますが、使用は自己責任でお願いします。
