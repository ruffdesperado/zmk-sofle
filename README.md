# Eyelash Sofle: TailorKey layout

ZMK firmware for my Eyelash Sofle with nice!view Gem displays. The layout is
[TailorKey](https://sites.google.com/view/tailorkey) for the MoErgo Go60, in its
Windows/Linux setup, which is also what I use on my Glove80. My changes to it are
listed [below](#my-changes-to-tailorkey).

## Keymap

![Keymap](keymap-drawer/eyelash_sofle.svg)

The picture is redrawn from [`config/eyelash_sofle.keymap`](config/eyelash_sofle.keymap)
every time the keymap changes, so it always shows the current layout.

## Layers

| Layer | How to get there | What's on it |
|---|---|---|
| Base | | QWERTY with home row mods: Win, Alt, Ctrl, Shift on A S D F, mirrored on ; L K J |
| Func | Hold Delete or the bottom-right key | F1–F12, mouse buttons, arrows and page keys, RGB lighting |
| System | Hold the bottom-left key | Bluetooth devices, USB or Bluetooth output, reset and flashing mode |
| Symbol | Hold Space | Symbols and brackets; sticky Shift, Ctrl, Alt, Win on M , . / |
| Cursor | Hold Backspace | Arrows, Home/End, Page Up/Down, undo/redo, cut/copy/paste, selecting text |
| Mouse | Hold Enter | Moving the pointer, scrolling and clicking |
| Slow, Fast, Warp | In Mouse, hold X or L (Slow), V or J (Fast), C or K (Warp) | Pointer and scroll speed |

The left display shows the name of the active layer.

### Thumb keys, encoder and 5-way switch

- **Left thumbs:** Home, ← and → on the straight row. Backspace (hold for Cursor) and
  Delete (hold for Func) on the angled keys.
- **Right thumbs:** Enter (hold for Mouse) and Space (hold for Symbol) on the angled
  keys. ↑, ↓ and End on the straight row.
- **Encoder:** volume; press to mute. It scrolls on the Func, System and Mouse layers.
- **5-way switch:** arrow keys; press for Enter. On the Func, System and Mouse layers it
  moves the mouse pointer and clicks.

### Combos

Press the keys together:

| Keys | Result |
|---|---|
| A number key + the key below it (1+Q … 0+P) | F1–F10 |
| `-` + `\`, or 0 + `-` | F11, or F12 |
| Backspace + Space | Caps Lock |
| X + Home, V + →, or B + Backspace | Alt+Tab, Ctrl+Tab, or Win+Tab. Keep holding, pick with the arrows on J K L ;, then let go. |
| M + ↑, or , + ↓ | Sticky Hyper (Ctrl+Alt+Shift+Win), or sticky Meh (Ctrl+Alt+Shift) |

## My changes to TailorKey

- **Keys the Sofle doesn't have:** the Go60's innermost thumb keys (Shift and Right Alt
  on Base) have no place on the Sofle. The Symbol layer's `@` from there moved to the 7
  key, and the Cursor layer's Win+D and Select None are gone.
- **Cursor layer:** Select All (Ctrl+A) replaces Select Word on C. On the thumbs, Enter
  is Select All and Space is Select Line, where TailorKey has Extend Line and Extend
  Word.
- **Mouse layer:** U, I and O are left, middle and right click instead of sticky Shift,
  Ctrl and Alt. The encoder scrolls, and pressing it is a middle click.
- **Windows shortcuts:** the Go60 layout file is TailorKey's Dual OS version, whose shared
  layers use macOS shortcuts in two places. Here the Symbol layer's sticky mods are in
  Windows order (Shift, Ctrl, Alt, Win), and the Mouse layer's cut/copy/paste use Ctrl,
  as in the Glove80's Windows version.
- **Func and System:** these are the Sofle's original Layer 1 and Layer 2, renamed. They
  stand in for TailorKey's Keypad and Magic layers, which aren't ported yet, so Delete
  and the bottom corner keys open them instead.
- **5-way switch speed:** 1× on the Func and System layers (the original config had 2×).
  The Mouse layer uses TailorKey's pointer speeds.
- **Not ported yet:** TailorKey's Keypad, Magic, Typing, Autoshift and Gaming layers.

## Flashing

1. Open the latest [Build ZMK firmware](https://github.com/ruffdesperado/zmk-sofle/actions/workflows/build.yml)
   run, download **firmware** under Artifacts, and unzip it.
2. Plug the half you're flashing into USB and double-press its reset switch. A USB drive
   appears.
3. Copy that half's `.uf2` file onto the drive. The drive disappears by itself when it's
   done.

| File | When to use it |
|---|---|
| `nice_view_gem-eyelash_sofle_left-zmk.uf2` | Left half. Keymap changes only need this one. |
| `nice_view_gem-eyelash_sofle_right-zmk.uf2` | Right half, when the firmware itself changes (like a ZMK update). |
| `eyelash_sofle_studio_left.uf2` | Left half with [ZMK Studio](https://zmk.studio) for editing keys live over USB. Changes saved in Studio override this keymap; "Restore Stock Settings" in Studio clears them. |
| `settings_reset-eyelash_sofle_left-zmk.uf2` | Clears saved settings and Bluetooth pairings. If the halves won't connect, flash it on both halves, then the normal files, and pair again. |

Once the firmware is on, you can skip the reset switch: hold the bottom-left key and
press C to put the left half in flashing mode, or / for the right half.

Other System layer shortcuts (hold the bottom-left key): 1–5 pick a Bluetooth device,
Q forgets the current one, A switches typing to USB and S back to Bluetooth.

## Build notes

- To change the layout, edit [`config/eyelash_sofle.keymap`](config/eyelash_sofle.keymap)
  and push. GitHub builds new firmware and redraws the keymap picture.
- ZMK and nice-view-gem are pinned to v0.3.0 in [`config/west.yml`](config/west.yml), and
  the build workflow in [`.github/workflows/build.yml`](.github/workflows/build.yml) is
  pinned to match. The board files in [`boards/arm/eyelash_sofle`](boards/arm/eyelash_sofle)
  use the older board format, which newer ZMK (Zephyr 4.1) can't build. Keep the pins in
  sync.

## Credits

- The original Eyelash Sofle config is by [a741725193](https://github.com/a741725193), the
  keyboard's maker. For 3D-print files or hardware problems, their original README says to
  contact 380465425@qq.com.
- [TailorKey](https://sites.google.com/view/tailorkey) layout.
- [nice-view-gem](https://github.com/M165437/nice-view-gem) display theme.
- [keymap-drawer](https://github.com/caksoylar/keymap-drawer) for the keymap picture.
