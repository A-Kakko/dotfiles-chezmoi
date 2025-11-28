#!/bin/bash
# pywalテーマをomarchyに適用するスクリプト（静かに実行）

OMARCHY_THEME_SRC="$HOME/.config/omarchy/themes/pywal"
OMARCHY_CURRENT="$HOME/.config/omarchy/current/theme"

# pywalテーマが生成されているか確認
if [ ! -d "$OMARCHY_THEME_SRC" ]; then
    echo "Error: pywal theme not found. Run generate-omarchy-theme.sh first."
    exit 1
fi

# ブラウザやObsidianの起動を避けるため、直接ファイルをコピー
cp -f "$OMARCHY_THEME_SRC/ghostty.conf" "$OMARCHY_CURRENT/ghostty.conf" 2>/dev/null
cp -f "$OMARCHY_THEME_SRC/kitty.conf" "$OMARCHY_CURRENT/kitty.conf" 2>/dev/null
cp -f "$OMARCHY_THEME_SRC/hyprland.conf" "$OMARCHY_CURRENT/hyprland.conf" 2>/dev/null
cp -f "$OMARCHY_THEME_SRC/hyprlock.conf" "$OMARCHY_CURRENT/hyprlock.conf" 2>/dev/null
cp -f "$OMARCHY_THEME_SRC/waybar.css" "$OMARCHY_CURRENT/waybar.css" 2>/dev/null
cp -f "$OMARCHY_THEME_SRC/walker.css" "$OMARCHY_CURRENT/walker.css" 2>/dev/null
cp -f "$OMARCHY_THEME_SRC/swayosd.css" "$OMARCHY_CURRENT/swayosd.css" 2>/dev/null
cp -f "$OMARCHY_THEME_SRC/btop.theme" "$OMARCHY_CURRENT/btop.theme" 2>/dev/null
cp -f "$OMARCHY_THEME_SRC/alacritty.toml" "$OMARCHY_CURRENT/alacritty.toml" 2>/dev/null
cp -f "$OMARCHY_THEME_SRC/mako.ini" "$OMARCHY_CURRENT/mako.ini" 2>/dev/null

# Neovimはコピーしない（Catppuccinのまま）

# Waybarをリロード（静かに）
pkill -SIGUSR2 waybar 2>/dev/null

echo "✓ Pywal theme applied quietly"
