# Pywal + Omarchy 自動テーマ設定

壁紙の変更に追従して自動的にカラースキームを変更するシステム。

## 仕組み

1. **壁紙の変更** (`~/.config/hypr/scripts/wallpaper.sh`)
   - 10分ごとに`~/Wallpapers`からランダムな壁紙を選択
   - `swww`で壁紙を設定

2. **色の抽出** (pywal)
   - 壁紙から16色のカラーパレットを自動生成
   - `~/.cache/wal/`に色情報を保存

3. **テーマの生成** (`generate-omarchy-theme.sh`)
   - pywalの色からomarchyのテーマファイルを動的生成
   - `~/.config/omarchy/themes/pywal/`に保存

4. **テーマの適用** (`apply-theme.sh`)
   - 生成されたテーマを`~/.config/omarchy/current/theme/`にコピー
   - Waybarをリロード

## 適用されるアプリ

- ✅ Ghostty（ターミナル）
- ✅ Kitty（ターミナル）
- ✅ Alacritty（ターミナル）
- ✅ Hyprland（ウィンドウボーダー）
- ✅ Hyprlock（ロック画面）
- ✅ Waybar（ステータスバー）
- ✅ Walker（ランチャー）
- ✅ SwayOSD（OSD）
- ✅ Btop（システムモニター）
- ✅ Fish shell（シェル）
- ❌ Neovim（Catppuccin固定 - コーディングの視認性のため）

## ファイル構成

```
~/.config/scripts/pywal/
├── generate-omarchy-theme.sh  # pywal色からomarchyテーマを生成
├── apply-theme.sh              # テーマを適用
└── README.md                   # このファイル

~/.config/hypr/scripts/
└── wallpaper.sh                # 壁紙自動変更スクリプト

~/.config/fish/
└── config.fish                 # pywalの色を読み込む設定を追加

~/.config/omarchy/themes/pywal/ # 生成されるテーマファイル
~/.cache/wal/                   # pywalの色データ
```

## カスタマイズ

### 壁紙の切り替え間隔を変更

`~/.config/hypr/scripts/wallpaper.sh:4`
```bash
INTERVAL=600  # 秒単位（600 = 10分）
```

### 適用するアプリを変更

`~/.config/scripts/pywal/generate-omarchy-theme.sh`と
`~/.config/scripts/pywal/apply-theme.sh`を編集

### Neovimにもpywalを適用したい場合

`apply-theme.sh:25`のコメントを外してコピーを有効化：
```bash
cp -f "$OMARCHY_THEME_SRC/neovim.lua" "$OMARCHY_CURRENT/neovim.lua" 2>/dev/null
```

ただし、`generate-omarchy-theme.sh`のNeovim設定を`wal.vim`プラグインを使う設定に変更する必要があります。

## トラブルシューティング

### テーマが適用されない

```bash
# 手動でテーマを生成
~/.config/scripts/pywal/generate-omarchy-theme.sh

# 手動でテーマを適用
~/.config/scripts/pywal/apply-theme.sh
```

### 壁紙スクリプトを再起動

```bash
pkill -f wallpaper.sh
~/.config/hypr/scripts/wallpaper.sh &
```

### pywalの色を確認

```bash
cat ~/.cache/wal/colors.json
```

## 注意事項

- Neovimは意図的にCatppuccinテーマを維持（コードの視認性のため）
- テーマ適用時にブラウザやObsidianは起動されない（静かに動作）
- 壁紙変更時のログは`/dev/null`にリダイレクト
