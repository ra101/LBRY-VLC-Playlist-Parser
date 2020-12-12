# LBRY VLC Playlist Parser

This addon will allow [VLC](https://www.videolan.org/vlc/) to open any free [lbry.tv](https://lbry.tv/) video direct from the link.

**Why Create this, when LBRY Desktop app already exists?**

~~For VLC key-binding... idk... I had nothing better to do...~~

Helps a lot on older CPUs that cannot run the LBRY streams in the browser.

*(reddit user [bitgoblin10k](https://www.reddit.com/user/bitgoblin10k/) pointed this out)*



## Usage
- Copy the URL of the lbry video ( say [https://lbry.tv/@ra101:a/MasquerBot:1](https://lbry.tv/@ra101/MasquerBot ) )
- Start VLC and...
  - Press Ctrl+N or Select `Open Network Stream...` from Media menu.
  - Paste the url then click on "Play" (or Alt+P then Enter)

## Installation

To install, download the `lbry.lua` file and place it in the following directory, depending on your operating system:

#### Windows:

- All Users

  ``````
  %ProgramFiles%\VideoLAN\VLC\lua\playlist
  ``````

- Current User

  ``````
  %APPDATA%\vlc\lua\playlist\
  ``````

#### **macOS**:

```
/Users/(your username)/Library/Application Support/org.videolan.vlc/lua/playlist/
```

#### **Linux**:

```
~/.local/share/vlc/lua/playlist/
```

<br>

**PS: Note that you may have to create some directories in the path if they don’t exist.**
