# Quick Start Guide

## 🚀 Get Running in 3 Steps

### Step 1: Install Dependencies

```bash
pnpm install
```

### Step 2: Choose Your Platform

#### Option A: Desktop (Easiest to get started)

```bash
pnpm run tauri dev
```

#### Option B: iOS (Requires macOS + Xcode)

```bash
# First time setup
./setup-ios.sh

# Update Team ID in src-tauri/tauri.conf.json
# Then initialize iOS project
pnpm run tauri ios init

# Run on simulator
pnpm run tauri ios dev
```

### Step 3: Start Building!

The app includes a simple "greet" command that demonstrates:

- 📱 Frontend → Backend communication
- 🦀 Rust command invocation from TypeScript
- 🎨 Responsive UI with dark mode

## 📝 What's in the Box?

- **Frontend**: Vite + TypeScript + CSS
- **Backend**: Rust + Tauri
- **Example**: Greet command demonstrating IPC (Inter-Process Communication)

## 🎯 Next Steps

1. **Customize the UI**: Edit `src/main.ts` and `src/style.css`
2. **Add Rust commands**: Edit `src-tauri/src/lib.rs`
3. **Configure app**: Edit `src-tauri/tauri.conf.json`

## 📚 Need Help?

- Check the full [README.md](./README.md) for detailed documentation
- Visit [Tauri Docs](https://tauri.app/) for framework help
- Check [Tauri Mobile Guide](https://tauri.app/develop/mobile/) for iOS specifics

## 🐛 Common Issues

**"pnpm run tauri: command not found"**

- Make sure you've run `pnpm install` first

**iOS build fails**

- Verify Xcode is installed
- Check that your Team ID is set correctly
- Run `./setup-ios.sh` to verify your environment

**"No development team"**

- You need an Apple Developer account (free or paid)
- Set your Team ID in `src-tauri/tauri.conf.json`

Happy coding! 🎉
