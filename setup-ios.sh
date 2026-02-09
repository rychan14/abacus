#!/bin/bash

echo "🍎 Tauri iOS Setup Helper"
echo "=========================="
echo ""

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "❌ Error: iOS development requires macOS"
    exit 1
fi

# Check for Xcode
if ! command -v xcodebuild &> /dev/null; then
    echo "❌ Xcode is not installed"
    echo "Please install Xcode from the App Store"
    exit 1
else
    echo "✅ Xcode is installed"
fi

# Check for Rust
if ! command -v rustc &> /dev/null; then
    echo "❌ Rust is not installed"
    echo "Install it with: curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
    exit 1
else
    echo "✅ Rust is installed ($(rustc --version))"
fi

# Check for iOS targets
if rustup target list | grep -q "aarch64-apple-ios (installed)"; then
    echo "✅ iOS ARM64 target is installed"
else
    echo "📦 Installing iOS ARM64 target..."
    rustup target add aarch64-apple-ios
fi

if rustup target list | grep -q "aarch64-apple-ios-sim (installed)"; then
    echo "✅ iOS ARM64 simulator target is installed"
else
    echo "📦 Installing iOS ARM64 simulator target..."
    rustup target add aarch64-apple-ios-sim
fi

# Check for Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed"
    echo "Please install Node.js from https://nodejs.org/"
    exit 1
else
    echo "✅ Node.js is installed ($(node --version))"
fi

# Check for npm packages
if [ ! -d "node_modules" ]; then
    echo "📦 Installing npm dependencies..."
    pnpm install
else
    echo "✅ npm dependencies are installed"
fi

echo ""
echo "🎉 Setup complete!"
echo ""
echo "Next steps:"
echo "1. Update 'developmentTeam' in src-tauri/tauri.conf.json with your Apple Team ID"
echo "2. Run: pnpm run tauri ios init"
echo "3. Run: pnpm run tauri ios dev"
echo ""
echo "To find your Team ID:"
echo "- Open Xcode → Preferences → Accounts"
echo "- Select your Apple ID"
echo "- Your Team ID is shown next to your team name"
