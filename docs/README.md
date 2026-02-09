# Tauri iOS App

A cross-platform mobile and desktop application built with Tauri, Rust, Vite, and vanilla TypeScript.

## Features

- 🦀 Rust backend with Tauri
- ⚡ Vite for fast development
- 📱 iOS support (with desktop support too)
- 🎨 Vanilla TypeScript frontend
- 🌙 Dark mode support

## Prerequisites

### For iOS Development

1. **macOS** (required for iOS development)
2. **Xcode** (latest version from App Store)
3. **Xcode Command Line Tools**:
   ```bash
   xcode-select --install
   ```
4. **Rust** (install via rustup):
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```
5. **iOS targets**:
   ```bash
   rustup target add aarch64-apple-ios aarch64-apple-ios-sim
   ```
6. **Node.js** (v18 or higher)
7. **Tauri CLI**:
   ```bash
   npm install -g @tauri-apps/cli
   ```

### For Desktop Development

1. **Rust** (see above)
2. **Node.js** (v18 or higher)
3. **Platform-specific requirements**:
   - **Linux**: `webkit2gtk`, `libayatana-appindicator3`, and other dependencies
   - **Windows**: WebView2 (usually pre-installed on Windows 11)
   - **macOS**: Xcode Command Line Tools

## Getting Started

### 1. Install Dependencies

```bash
npm install
```

### 2. Development

#### Desktop Development

```bash
npm run tauri dev
```

#### iOS Development

First, initialize the iOS project:

```bash
npm run tauri ios init
```

Then update the `developmentTeam` in `src-tauri/tauri.conf.json` with your Apple Team ID.

To find your Team ID:

1. Open Xcode
2. Go to Preferences > Accounts
3. Select your Apple ID
4. Your Team ID is shown next to your team name

Run on iOS simulator:

```bash
npm run tauri ios dev
```

Run on iOS device:

```bash
npm run tauri ios dev --open
```

This will open Xcode where you can select your device and build/run.

### 3. Building for Production

#### Desktop

```bash
npm run tauri build
```

#### iOS

```bash
npm run tauri ios build
```

## Project Structure

```
abacus/
├── src/                    # Frontend source
│   ├── main.ts            # Main TypeScript entry point
│   └── style.css          # Styles
├── src-tauri/             # Rust backend
│   ├── src/
│   │   ├── lib.rs         # Library entry point (for mobile)
│   │   └── main.rs        # Desktop entry point
│   ├── Cargo.toml         # Rust dependencies
│   ├── tauri.conf.json    # Tauri configuration
│   └── capabilities/      # Security permissions
├── index.html             # HTML entry point
├── vite.config.ts         # Vite configuration
├── tsconfig.json          # TypeScript configuration
└── package.json           # Node dependencies
```

## Available Commands

- `npm run dev` - Start Vite dev server
- `npm run build` - Build frontend for production
- `npm run tauri dev` - Start Tauri in development mode (desktop)
- `npm run tauri build` - Build Tauri app for production (desktop)
- `npm run tauri ios init` - Initialize iOS project
- `npm run tauri ios dev` - Run on iOS simulator/device
- `npm run tauri ios build` - Build iOS app for production

## Customization

### Adding Rust Commands

1. Add your command in `src-tauri/src/lib.rs`:

```rust
#[tauri::command]
fn my_command(arg: String) -> String {
    format!("Received: {}", arg)
}
```

2. Register it in the builder:

```rust
.invoke_handler(tauri::generate_handler![greet, my_command])
```

3. Call from TypeScript:

```typescript
import { invoke } from "@tauri-apps/api/core";

const result = await invoke<string>("my_command", { arg: "Hello" });
```

### iOS-Specific Configuration

Edit `src-tauri/tauri.conf.json` under `bundle.iOS`:

- `developmentTeam`: Your Apple Developer Team ID
- `minimumSystemVersion`: Minimum iOS version (default: "13.0")

### App Icons

Place your app icons in:

- Desktop: `src-tauri/icons/`
- iOS: Will be generated from the desktop icons when running `tauri ios init`

## Troubleshooting

### iOS Build Issues

1. **"No Development Team"**: Make sure you've set your `developmentTeam` in `tauri.conf.json`
2. **Signing errors**: Ensure your Apple Developer account is properly configured in Xcode
3. **Simulator not found**: Install iOS Simulator via Xcode preferences > Components

### Desktop Build Issues

1. **Missing WebKit**: On Linux, install webkit2gtk-4.1 or webkit2gtk-4.0
2. **Rust errors**: Make sure you have the latest stable Rust: `rustup update stable`

## Learn More

- [Tauri Documentation](https://tauri.app/)
- [Tauri iOS Guide](https://tauri.app/develop/mobile/)
- [Vite Documentation](https://vitejs.dev/)
- [TypeScript Documentation](https://www.typescriptlang.org/)

## License

MIT
