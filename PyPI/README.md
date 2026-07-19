## 1. Environment

- Python 3.14.6
- pip 26.1.2

## 2. Installation

```command
$ pipx install spreen-tracks
```

(`pip install spreen-tracks` works too if you prefer managing the environment yourself.)

For development, install the dependencies via requirements.txt:

```command
$ pip install -r requirements.txt
```

## 3. Execution

Run the command inside your music directory — with no options it dry-runs, printing every rename it would perform without touching a file:

```command
$ cd ~/Music
$ track-delimiter
Target extension is `.m4a`
========== [DRY RUN] Total File Count to Clean: 4 ==========
========== [DRY RUN] The delimiters of those files will be replaced with `_` ==========
========== [DRY RUN] Start! ==========
========== [DRY RUN] Replacing the delimiter: `./Artist/Album1/1-01 Title.m4a` => `./Artist/Album1/Disc1/01_Title.m4a` ==========
========== [DRY RUN] Replacing the delimiter: `./Artist/Album1/2-01 Title.m4a` => `./Artist/Album1/Disc2/01_Title.m4a` ==========
========== [DRY RUN] Replacing the delimiter: `./Artist/Album2/01 Title.m4a` => `./Artist/Album2/01_Title.m4a` ==========
========== [DRY RUN] Replacing the delimiter: `./Artist/Album2/02 Title.m4a` => `./Artist/Album2/02_Title.m4a` ==========
========== [DRY RUN] Done! ==========
========== [DRY RUN] Total Target File Count: 4 ==========
```

When the plan looks right, execute it with `--mode e`; `--extension` and `--delimiter` override the defaults:

```command
$ track-delimiter --mode e
$ track-delimiter --extension .mp3 --delimiter - --mode e
```

As a library:

```python
from spreen_tracks import Application

Application.run()                            # dry run over ./**/*.m4a
Application.run(delimiter='-', mode='e')     # execute the renames
```

## 4. Unit Test

```command
$ pytest
============================= test session starts ==============================
platform linux -- Python 3.14.6, pytest-9.1.1, pluggy-1.6.0
rootdir: spreen-tracks/PyPI
configfile: pyproject.toml
collected 9 items

test/test_application.py ....                                            [ 44%]
test/test_cli.py .....                                                   [100%]

============================== 9 passed in 0.16s ===============================
```

## 5. Static Code Analysis

```command
$ flake8 .
$ autoflake8 --in-place --remove-duplicate-keys --remove-unused-variables --recursive .
$ autopep8 --in-place --aggressive --aggressive --recursive .
```

## 6. Type Checks

```command
$ mypy .
Success: no issues found in 6 source files
```

## 7. Build

```command
$ python -m build
$ pipx install ./dist/spreen_tracks-0.1.0-py3-none-any.whl
```
