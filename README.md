# System7 GTK Theme

An authentic recreation of the classic Mac System 7 interface as a GTK theme, bringing the nostalgic 1990s Macintosh aesthetic to modern Linux and Unix systems.

## Quick Start (macOS)

```bash
# Clone the repository
git clone <repository-url> ~/work/Personal/System7
cd ~/work/Personal/System7

# Install dependencies
brew install gtk+3 gtk4 sassc

# Build the theme
./build.sh

# Install to themes directory
./build.sh --install

# Test with GTK demo
GTK_THEME=System7 gtk3-demo
```

## Features

- **Authentic System 7 Look**: Pixel-perfect recreation of classic Mac OS interface
- **GTK3 and GTK4 Support**: Compatible with modern GTK applications
- **Classic Elements**: 
  - 3D beveled buttons with proper highlights and shadows
  - Black window borders with gray titlebars
  - Purple-blue scrollbars with arrow buttons
  - Sharp corners and high contrast
  - Classic drop shadows (2px offset)
- **Modular SCSS Structure**: Organized component-based styling
- **Complete Widget Coverage**: All GTK widgets styled to match System 7

## Directory Structure

```
System7/
├── gtk-3.0/               # GTK3 theme files
│   ├── scss/              # SCSS source files
│   │   ├── components/    # Component-specific styles
│   │   ├── mixins/        # Reusable SCSS mixins
│   │   └── _variables.scss
│   ├── gtk.css            # Compiled CSS (generated)
│   └── gtk-dark.css       # Dark variant (generated)
├── gtk-4.0/               # GTK4 theme files
│   ├── scss/              # SCSS source files
│   ├── gtk.css            # Compiled CSS (generated)
│   └── gtk-dark.css       # Dark variant (generated)
├── assets/                # Theme assets and images
├── index.theme            # Theme metadata
├── build.sh               # Build script
└── README.md              # This file
```

## macOS Development Setup

### Prerequisites

1. **Install Homebrew** (if not already installed):
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Install GTK and Development Tools**:
   ```bash
   # Core GTK libraries
   brew install gtk+3 gtk4
   
   # Theme development tools
   brew install sassc
   
   # Optional: Additional tools
   brew install inkscape optipng
   
   # Optional: GTK demos for testing
   brew install adwaita-icon-theme
   ```

3. **Install XQuartz** (for better GTK support on macOS):
   ```bash
   brew install --cask xquartz
   ```
   Note: You may need to log out and back in after installing XQuartz.

### Known Issues on macOS

- **Theme Not Applying**: GTK on macOS doesn't always respect the GTK_THEME environment variable
- **Window Decorations**: macOS uses native window decorations, so titlebar styling may not fully apply
- **Font Rendering**: System 7 fonts (Chicago) may not be available; falls back to system fonts

## Building the Theme

### Prerequisites

- `sassc` - SASS compiler
- `GTK3/GTK4` - For testing
- `inkscape` - For asset generation (optional)
- `optipng` - For PNG optimization (optional)

### Compile CSS from SCSS

```bash
# Simple build
./build.sh

# Build and install to ~/.themes
./build.sh --install

# Watch for changes and auto-rebuild
./build.sh --watch
```

## Installation

### Local Installation (for testing)

1. Build the theme:
   ```bash
   ./build.sh
   ```

2. Install to your user themes directory:
   ```bash
   ./build.sh --install
   ```

3. Test with GTK demos:
   ```bash
   GTK_THEME=System7 gtk3-demo
   GTK_THEME=System7 gtk4-demo
   ```

### Linux Installation

1. Copy the entire System7 directory to one of these locations:
   - User-specific: `~/.themes/System7`
   - System-wide: `/usr/share/themes/System7`

2. Set as default theme:
   ```bash
   gsettings set org.gnome.desktop.interface gtk-theme 'System7'
   ```

## System 7 Design Reference

### Color Palette

The theme uses authentic System 7 colors:

| Element | Color | Hex Code | Usage |
|---------|-------|----------|-------|
| Background | White | `#ffffff` | Windows, dialogs, menus |
| Text | Black | `#000000` | All text and borders |
| Titlebar | Light Gray | `#d8d8d8` | Window titlebars |
| Button | Gray | `#dedede` | Standard buttons |
| Button Highlight | White | `#ffffff` | Top-left button bevel |
| Button Shadow | Dark Gray | `#bcbcbc` | Bottom-right button bevel |
| Scrollbar Thumb | Purple-Blue | `#9b9bf9` | Scrollbar handles |
| Scrollbar Track | Gray | `#aaaaab` | Scrollbar background |
| Selection | Black | `#000000` | Selected items (inverted) |
| Disabled | Gray | `#808080` | Inactive elements |

### Visual Characteristics

- **No rounded corners**: All elements use sharp, rectangular edges
- **1px black borders**: High contrast borders on all UI elements  
- **3D bevel effects**: Inset highlights and shadows on buttons and controls
- **2px drop shadows**: Consistent shadow offset to the bottom-right
- **Inverted selection**: Black background with white text
- **Pixel patterns**: Scrollbar thumbs use repeating line patterns

## Customization

### Changing Colors

Edit `gtk-3.0/scss/_variables.scss` to modify the color scheme:

```scss
// Classic Mac System 7 Colors
$bg_color: #ffffff;           // Background color
$fg_color: #000000;           // Text color
$selected_bg_color: #000000;  // Selection color
$selected_fg_color: #ffffff;  // Selected text color
$titlebar_bg: #d8d8d8;        // Titlebar gray
$button_bg_classic: #dedede;  // Button gray
$scrollbar_thumb: #9b9bf9;    // Scrollbar purple
```

### Modifying Components

Component styles are organized in separate files:
- `gtk-3.0/scss/components/_buttons.scss` - Button styles
- `gtk-3.0/scss/components/_entries.scss` - Input field styles

### Creating a Dark Variant

Create `gtk-3.0/scss/gtk-dark.scss` with dark color overrides:

```scss
@import 'variables';

// Override colors for dark theme
$bg_color: #2d2d2d;
$fg_color: #eeeeee;
$base_color: #404040;

@import 'gtk';
```

## Development Workflow

### Project Structure
```
System7/
├── examples/           # Reference System 7 CSS/JS from web implementation
│   ├── system7.css    # Original System 7 web CSS for reference
│   └── *.js           # JavaScript implementations (reference only)
├── gtk-3.0/           # GTK3 theme
│   ├── scss/          # Source SCSS files
│   │   ├── _variables.scss      # Color and spacing variables
│   │   ├── components/          # Widget-specific styles
│   │   └── mixins/              # Reusable style mixins
│   └── gtk.css        # Generated CSS (don't edit directly)
├── gtk-4.0/           # GTK4 theme
└── build.sh           # Build script
```

### Making Changes

1. **Edit SCSS files** (never edit .css directly):
   ```bash
   # Main variables
   vim gtk-3.0/scss/_variables.scss
   
   # Component styles
   vim gtk-3.0/scss/components/_buttons.scss
   ```

2. **Rebuild the theme**:
   ```bash
   ./build.sh
   ```

3. **Watch mode for development**:
   ```bash
   ./build.sh --watch
   ```

4. **Test changes**:
   ```bash
   # Kill existing demo
   pkill gtk3-demo
   
   # Launch with theme
   GTK_THEME=System7 gtk3-demo
   ```

## Testing

### On macOS

#### Method 1: Environment Variable (may not work reliably)
```bash
GTK_THEME=System7 gtk3-demo
GTK_THEME=System7 gtk4-demo
```

#### Method 2: Using gsettings (more reliable)
```bash
# Set theme globally
gsettings set org.gnome.desktop.interface gtk-theme 'System7'

# Launch demo
gtk3-demo
```

#### Method 3: GTK Inspector
1. Launch app with inspector:
   ```bash
   GTK_DEBUG=interactive gtk3-demo
   ```
2. In the inspector, go to Visual → Theme → Select "System7"

### Testing with Real Applications
```bash
# Text editor
GTK_THEME=System7 gedit

# File manager
GTK_THEME=System7 nautilus

# Image editor
GTK_THEME=System7 gimp
```

### On Linux
Once installed, the theme can be selected through:
- GNOME Tweaks
- System Settings (varies by desktop environment)
- Command line: `gsettings set org.gnome.desktop.interface gtk-theme 'System7'`

## Troubleshooting

### Theme Not Applying on macOS

1. **Check theme is installed**:
   ```bash
   ls -la ~/.themes/System7/
   ```

2. **Verify GTK can find the theme**:
   ```bash
   GTK_DEBUG=modules GTK_THEME=System7 gtk3-demo 2>&1 | grep -i theme
   ```

3. **Try setting via configuration**:
   ```bash
   # Create GTK3 settings
   mkdir -p ~/.config/gtk-3.0
   echo '[Settings]' > ~/.config/gtk-3.0/settings.ini
   echo 'gtk-theme-name = System7' >> ~/.config/gtk-3.0/settings.ini
   ```

4. **Use XQuartz display**:
   ```bash
   # Start XQuartz
   open -a XQuartz
   
   # Set display
   export DISPLAY=:0
   
   # Run app
   GTK_THEME=System7 gtk3-demo
   ```

### Common Issues

- **"Theme not found"**: Ensure theme is in `~/.themes/System7` or `/usr/share/themes/System7`
- **Partial styling**: Some apps override theme settings; try different GTK apps
- **Wrong colors**: Rebuild the theme with `./build.sh`
- **SCSS errors**: Check syntax in .scss files, ensure all variables are defined

## Compatibility

- **GTK3**: 3.20+
- **GTK4**: 4.0+
- **Desktop Environments**: GNOME, XFCE, Cinnamon, MATE

## Development

### Adding New Components

1. Create a new SCSS file in `scss/components/`
2. Import it in the main `gtk.scss` file
3. Run `./build.sh` to compile

### Contributing

Feel free to submit issues and pull requests for improvements!

## License

This theme is provided as-is for personal and commercial use.

## Credits

Built with GTK theming best practices and modern SCSS architecture.