#!/bin/bash
# System7 GTK Theme Build Script

set -e

THEME_NAME="System7"
THEME_DIR=$(pwd)

echo "Building $THEME_NAME theme..."

# Compile GTK3 SCSS
echo "Compiling GTK3 theme..."
sassc -t expanded \
    "${THEME_DIR}/gtk-3.0/scss/gtk.scss" \
    "${THEME_DIR}/gtk-3.0/gtk.css"

# Compile GTK4 SCSS
echo "Compiling GTK4 theme..."
sassc -t expanded \
    "${THEME_DIR}/gtk-4.0/scss/gtk.scss" \
    "${THEME_DIR}/gtk-4.0/gtk.css"

# Create dark theme variants (optional)
echo "Creating dark theme variants..."

# GTK3 Dark variant
if [ -f "${THEME_DIR}/gtk-3.0/scss/gtk-dark.scss" ]; then
    sassc -t expanded \
        "${THEME_DIR}/gtk-3.0/scss/gtk-dark.scss" \
        "${THEME_DIR}/gtk-3.0/gtk-dark.css"
else
    # For now, copy main theme as dark variant
    cp "${THEME_DIR}/gtk-3.0/gtk.css" "${THEME_DIR}/gtk-3.0/gtk-dark.css"
fi

# GTK4 Dark variant
if [ -f "${THEME_DIR}/gtk-4.0/scss/gtk-dark.scss" ]; then
    sassc -t expanded \
        "${THEME_DIR}/gtk-4.0/scss/gtk-dark.scss" \
        "${THEME_DIR}/gtk-4.0/gtk-dark.css"
else
    # For now, copy main theme as dark variant
    cp "${THEME_DIR}/gtk-4.0/gtk.css" "${THEME_DIR}/gtk-4.0/gtk-dark.css"
fi

echo "Theme build complete!"

# Optional: Install theme locally for testing
if [ "$1" == "--install" ]; then
    echo "Installing theme to ~/.themes/$THEME_NAME..."
    mkdir -p "$HOME/.themes"
    
    # Remove old installation if exists
    rm -rf "$HOME/.themes/$THEME_NAME"
    
    # Copy theme to user themes directory
    cp -r "$THEME_DIR" "$HOME/.themes/$THEME_NAME"
    
    echo "Theme installed to ~/.themes/$THEME_NAME"
    echo "You can test it with: GTK_THEME=$THEME_NAME gtk3-demo"
fi

# Optional: Watch for changes and rebuild
if [ "$1" == "--watch" ]; then
    echo "Watching for changes..."
    echo "Press Ctrl+C to stop"
    
    # Use fswatch if available, otherwise fall back to simple loop
    if command -v fswatch &> /dev/null; then
        fswatch -o "${THEME_DIR}/gtk-3.0/scss" "${THEME_DIR}/gtk-4.0/scss" | while read; do
            echo "Changes detected, rebuilding..."
            $0
        done
    else
        while true; do
            sleep 2
            $0
        done
    fi
fi