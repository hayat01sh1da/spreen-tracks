[![Actions Status: PyPI - CI](https://github.com/hayat01sh1da/spreen-tracks/workflows/PyPI%20-%20CI/badge.svg)](https://github.com/hayat01sh1da/spreen-tracks/actions?query=workflow%3A%22PyPI%20-%20CI%22)
[![Actions Status: PyPI - Daily Dependencies Update](https://github.com/hayat01sh1da/spreen-tracks/workflows/PyPI%20-%20Daily%20Dependencies%20Update/badge.svg)](https://github.com/hayat01sh1da/spreen-tracks/actions?query=workflow%3A%22PyPI%20-%20Daily%20Dependencies%20Update%22)
[![Actions Status: RubyGem - CI](https://github.com/hayat01sh1da/spreen-tracks/workflows/RubyGem%20-%20CI/badge.svg)](https://github.com/hayat01sh1da/spreen-tracks/actions?query=workflow%3A%22RubyGem%20-%20CI%22)
[![Actions Status: RubyGem - Daily Dependencies Update](https://github.com/hayat01sh1da/spreen-tracks/workflows/RubyGem%20-%20Daily%20Dependencies%20Update/badge.svg)](https://github.com/hayat01sh1da/spreen-tracks/actions?query=workflow%3A%22RubyGem%20-%20Daily%20Dependencies%20Update%22)
[![Actions Status: CodeQL](https://github.com/hayat01sh1da/spreen-tracks/workflows/CodeQL/badge.svg)](https://github.com/hayat01sh1da/spreen-tracks/actions?query=workflow%3A%22CodeQL%22)

# spreen-tracks

<img src="./assets/spreen-tracks-icon.svg" align="center" width="300" alt="spreen-tracks: an origami falcon stooping from a scattered note into the settled disc across a falcon's-eye stone" />

Renames the music files iTunes imports so the filenames follow one consistent shape: the space after the track number becomes a configurable delimiter, and `N-` disc-number prefixes become `DiscN/` subdirectories.

The tool ships twice with identical behaviour: as the RubyGems gem **`spreen-tracks`** and as the PyPI library **`spreen-tracks`**.  
Both install the same `track-delimiter` command.

## 1. Origin of the Name

**stoop + preen = spreen** — dive on the scattered filenames, then groom them track by track.  
The icon tells the story: the origami falcon (隼 /hayabusa/) mid-stoop across the falcon's-eye stone, diving from the scattered note into the settled disc.

The full legend behind the `spreen` name — the falcon man, the stone in the rice field, and the falcon's-eye quartz — is told in [spreen-wiki's README](https://github.com/hayat01sh1da/spreen-wiki#1-origin-of-the-name).  
spreen-tracks is part of the `spreen-*` toolchain ([spreen-wiki](https://github.com/hayat01sh1da/spreen-wiki), [spreen-pr](https://github.com/hayat01sh1da/spreen-pr), spreen-tracks, [spreen-clean](https://github.com/hayat01sh1da/spreen-clean)): tools that take something scattered and return it settled.

## 2. Quickstart

Install one of the two implementations:

```command
$ gem install spreen-tracks
```

```command
$ pipx install spreen-tracks
```

(`pip install spreen-tracks` works too if you prefer managing the environment yourself.)

iTunes provides no user interface to control the delimiter when importing songs from CDs: files land as `Artist/Album/1-01 Title.m4a`, where the `1-` prefix is the disc number.  
Run the command inside your music directory — with no options it dry-runs, printing every rename it would perform without touching a file:

```command
$ cd ~/Music
$ track-delimiter
Target extension is `.m4a`
========== [DRY RUN] Total File Count to Clean: 4 ==========
========== [DRY RUN] The delimiters of those files will be replaced with `_` ==========
========== [DRY RUN] Start! ==========
========== [DRY RUN] Replacing the delimiter: `./Artist/Album/1-01 Title.m4a` => `./Artist/Album/Disc1/01_Title.m4a` ==========
========== [DRY RUN] Done! ==========
========== [DRY RUN] Total Target File Count: 1 ==========
```

When the plan looks right, execute it:

```command
$ track-delimiter --mode e
```

|Before |After |
|:-|:-|
|`Artist/Album/1-01 Title.m4a` |`Artist/Album/Disc1/01_Title.m4a` |
|`Artist/Album/01 Title.m4a` |`Artist/Album/01_Title.m4a` |

## 3. Options

|Option |Default |Description |
|:-|:-|:-|
|`--extension EXT` |`.m4a` |Target extension of the files to rename |
|`--delimiter CHAR` |`_` |Delimiter that replaces the space after the track number |
|`--mode MODE` |`d` |`d` prints the rename plan (dry run); `e` executes it |

Run `track-delimiter --help` for the full flag list; `--version` prints the version.  
Both packages also expose the logic as a library — see the per-language READMEs in § 4.

## 4. Development

- Common environment: WSL (Ubuntu 25.10)
- [Ruby implementation](./RubyGem/README.md) — gem sources under [./RubyGem/](./RubyGem/)
- [Python implementation](./PyPI/README.md) — package sources under [./PyPI/](./PyPI/)
- Release notes live in [CHANGELOG.md](./CHANGELOG.md)
