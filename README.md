# Mousiki 🎵

![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)
![Language](https://img.shields.io/badge/Language-C++17-orange.svg)
![Platform](https://img.shields.io/badge/Platform-Linux_%7C_Android-brightgreen.svg)

Hey there! Welcome to **Mousiki**, a terminal music player built from the ground up for people who prefer control, simplicity, and a keyboard.

I created Mousiki because I wanted a fast, focused TUI (Terminal User Interface) without any unnecessary interface layers. It’s designed to be completely keyboard-driven and fully configurable while giving you rich features like spectrum visualizers, synced lyrics, and online streaming—all without ever leaving your terminal.

## Preview

![Mousiki Preview](./rawlook.png)

## ✨ Features

- **Local Music Playback:** Instantly browse and play your local music files.
- **Online Search & Streaming:** Search and stream tracks directly from online sources.
- **Synced Lyrics:** Real-time, word-by-word active lyrics highlighting as the song plays.
- **Visualizers:** Real-time FFT spectrum, waveform rendering, and spinning disk art.
- **Queue Management:** Effortless queueing, shuffling, and repeating.
- **Highly Configurable:** Tweak colors, visualizer fluidity, animations, and hotkeys to match your exact workflow.

## 🚀 Supported Platforms

- **Native Support:** **Linux** and **Android (Termux)**.
- **Unverified Support:** *Windows* and *macOS*. (Support for these platforms is currently not verified because I don't have the hardware access needed to test and debug on those specific operating systems. If you try it out and get it working, feel free to contribute!)

## 🛠️ Getting Started

## Default Keybindings

Every key below can be changed with the `HKey...` entries in `$HOME/.config/mousiki/config.txt`, or on the **REFERENCE** tab in settings. Keys are case-sensitive. To bind several keys to one action, separate them with commas, for example `HKeyQuit="q,Q"`. Special key names: `ARROW_KEY_UP`, `ARROW_KEY_DOWN`, `ARROW_KEY_LEFT`, `ARROW_KEY_RIGHT`, `ENTER`, `TAB`, `SPACE`, `ESC`, `BACKSPACE`, `COMMA`. If two actions share a key, the status line reports the clash.

### Search & Playback
| Action | Keybinding | Config name | Description |
| :--- | :--- | :--- | :--- |
| **Local Search** | `/` | `HKeySearch` | Filter the local library as you type. `ENTER` keeps the result, `ESC` cancels |
| **Online Stream Search** | `/` then `s: query` | | Search and stream music online |
| **Home View** | `ESC` | `HKeyHome` | Back to the full local library, unfiltered |
| **Play** | `ENTER` | `HKeyPlay` | Play the selected track |
| **Play / Pause** | `p` / `P` | `HKeyTogglePlayPause` | Toggle playback |
| **Next Track** | `n` / `N` | `HKeyPlayNextSong` | Play the next queued track. With an empty queue, play the row after the current track |
| **Previous Track** | `b` | `HKeyPlayPreviousSong` | Go back to the previously played track. With no history, play the row above the current track |
| **Seek Forward** | `ARROW_RIGHT` | `HKeySeekForward` | Seek 5 seconds forward |
| **Seek Backward** | `ARROW_LEFT` | `HKeySeekBackward` | Seek 5 seconds backward. With the queue focused, moves the selected item down |
| **Volume Up** | `1` | `HKeyIncreaseVolume` | Raise volume by 5% |
| **Volume Down** | `2` | `HKeyDecreaseVolume` | Lower volume by 5% |
| **Retry Lyrics** | `l` / `L` | `HKeyRetryLyrics` | Fetch lyrics for the current track again |
| **Waveform Style** | `w` / `W` | `HKeyToggleWaveform` | Toggle raw / smooth waveform |

Shuffle, loop, and stop-after-track are set with `PlaybackMode` in settings (`s`).

### Navigation & Queue
| Action | Keybinding | Config name | Description |
| :--- | :--- | :--- | :--- |
| **Navigate Up** | `ARROW_UP` | `HKeyNavigateUp` | Move selection up |
| **Navigate Down** | `ARROW_DOWN` | `HKeyNavigateDown` | Move selection down |
| **Sort** | `T` | `HKeyCycleSort` | Cycle folder order / title A-Z / artist A-Z |
| **Switch Focus** | `TAB` | `HKeySwitchBetweenCards` | Move focus between the library and the queue |
| **Add to Queue** | `a` | `HKeyAddHoveringSongToQueue` | Enqueue selected track |
| **Remove from Queue** | `t` | `HKeyRemoveHoveringSongFromQueue` | Remove the selected queue item |
| **Remove Last Queued** | `d` | `HKeyRemoveLastFromQueue` | Remove the last item in the queue |
| **Queue Item Up** | `u` / `U` | `HKeyMoveQueueItemUp` | With the queue focused, move the selected item up |
| **Queue Item Down** | `D` | `HKeyMoveQueueItemDown` | With the queue focused, move the selected item down |
| **Settings** | `s` / `S` | `HKeySetting` | Open settings. `TAB` changes panel, `s` saves and closes, `ESC` closes |
| **Redraw** | `r` / `R` | `HKeyRedraw` | Redraw the screen after a resize glitch |
| **Quit** | `q` / `Q` | `HKeyQuit` | Quit the player |
| **Quit** | `q` | Exit application |


### Prerequisites & Installation

Mousiki relies on a few external tools for audio fetching, decoding, and lyrics. The easiest way to get started is by running the setup script on a Debian-based Linux system or Termux:

```bash
# Clone the repository
git clone https://github.com/johan--/mousiki.git
cd mousiki

# Run the setup script (installs dependencies, sets up config, and builds the app)
bash setup.sh
```

If you're building manually, ensure you have `cmake`, a C++17 compiler, `ffmpeg`, `yt-dlp`, and the Python `syncedlyrics` package installed.

### Running the App

After a successful build, you can start the player with:
```bash
./build/mousiki
```

## ⚙️ Configuration

Your configuration file will be automatically generated at `$HOME/.config/mousiki/config.txt`. From there, you have complete freedom to customize Mousiki.

### Adding Custom Music Paths
You can easily tell Mousiki where to look for your music. Simply add multiple `LocalMusicPath` entries in your `config.txt`:

```ini
# Add as many custom paths as you need:
LocalMusicPath=/custom/path
LocalMusicPath=/home/user/Music
```

## 🙏 Attribution & Dependencies

Mousiki stands on the shoulders of giants. A huge thank you to the developers behind these awesome open-source projects that make Mousiki tick:

- **[miniaudio](https://github.com/mackron/miniaudio):** An incredible single-file audio playback and capture library.
- **[kissfft](https://github.com/mborgerding/kissfft):** A wonderfully simple and lightweight real-input FFT library (powering the spectrum visualizer).
- **[yt-dlp](https://github.com/yt-dlp/yt-dlp):** The backend magic for our online search and streaming capabilities.
- **[syncedlyrics](https://github.com/rtcq/syncedlyrics):** Python package fetching the synced lyrics data.
- **[FFmpeg](https://ffmpeg.org/):** The Swiss army knife of multimedia handling.

## 📜 License

This project is open-sourced under the [Apache License 2.0](LICENSE). 

## Credits

Mousiki was originally created by ender ([itzender5820 on GitHub](https://github.com/itzender5820), [original repository](https://github.com/itzender5820/mousiki)). This fork is maintained by qoolpix.music ([qoolpix.music on Instagram](https://instagram.com/qoolpix.music)) and includes changes to the original code.

---
*Crafted with ❤️ for the terminal by [itzender5820](https://github.com/itzender5820)*
