#!/bin/bash

WALLPAPER_DIR="$HOME/Wallpapers"  # 壁紙フォルダのパス
INTERVAL=600  # 切り替え間隔（秒）デフォルト10分
LOCKFILE="/tmp/wallpaper.lock"

# ロックファイルを使って、一度に一つのインスタンスだけが動くようにする
exec 200>"$LOCKFILE"
flock -n 200 || { echo "Another instance is already running. Exiting."; exit 1; }

# スクリプト終了時にロックファイルを削除
trap "rm -f $LOCKFILE" EXIT

# ランダムな壁紙を選択して設定
while true; do
    #pkill swaybg
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.gif" \) | shuf -n 1)

    # 壁紙が見つからない場合はスキップ
    if [ -z "$WALLPAPER" ]; then
        echo "Warning: No wallpaper found in $WALLPAPER_DIR"
        sleep $INTERVAL
        continue
    fi

    swww img "$WALLPAPER" --transition-type random --transition-duration 2

    # Generate color scheme from wallpaper using pywal
    wal -n -i "$WALLPAPER" -q 2>/dev/null

    # Generate omarchy theme from pywal colors and apply it
    ~/.config/scripts/pywal/generate-omarchy-theme.sh >/dev/null 2>&1
    ~/.config/scripts/pywal/apply-theme.sh >/dev/null 2>&1

    sleep $INTERVAL
done
