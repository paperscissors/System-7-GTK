# System7 GTK Theme

A modern GTK theme with a clean, minimalist design that works with both GTK3 and GTK4 applications.

## Features

- **GTK3 and GTK4 Support**: Full theming for both GTK versions
- **Modular SCSS Structure**: Easy to customize and maintain
- **Clean Design**: Modern, flat design with subtle gradients and shadows
- **Responsive**: Smooth transitions and hover effects
- **Complete Widget Coverage**: Styled buttons, entries, headers, menus, and more

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

## Building the Theme

### Prerequisites

- `sassc` - SASS compiler (installed via Homebrew)
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

## Customization

### Changing Colors

Edit `gtk-3.0/scss/_variables.scss` to modify the color scheme:

```scss
$bg_color: #f6f6f6;           // Background color
$fg_color: #2e3436;           // Foreground/text color
$selected_bg_color: #4a90d9;  // Selection/highlight color
$selected_fg_color: #ffffff;  // Selected text color
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

## Testing

### On macOS
```bash
# Test GTK3 applications
GTK_THEME=System7 gtk3-demo

# Test GTK4 applications
GTK_THEME=System7 gtk4-demo
```

### On Linux
Once installed, the theme can be selected through:
- GNOME Tweaks
- System Settings (varies by desktop environment)
- Command line: `gsettings set org.gnome.desktop.interface gtk-theme 'System7'`

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