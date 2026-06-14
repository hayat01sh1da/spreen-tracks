## Supported Versions

- Only the latest code on `master` receives security updates.
- Historical versions are provided for reference and are unsupported unless the issue reproduces on the stack below.

## Ecosystem & Compatibility

| Component            | Version(s) / Tooling               | Notes                                                                                               |
| -------------------- | ---------------------------------- | --------------------------------------------------------------------------------------------------- |
| OS baseline          | WSL (Ubuntu 25.10)                 | Shared environment across tracks.                                                                   |
| Ruby CLI utilities   | Ruby 4.0.5 (`.ruby-version`)       | Uses standard library (`CSV`, `FileUtils`). Declare extra gems per script if needed.                |
| Gemfile              | 4.0.12                             | Per-project dependency manifest; versions install via Bundler.                                      |
| Bundler              | 4.0.12                             | Resolves and installs the gems declared in the Gemfile.                                             |
| Python CLI utilities | CPython 3.14.6 (`.python-version`) | Uses Python stdlib (`csv`, `argparse`). Introduce `requirements.txt` if third-party libs are added. |

## Backward Compatibility

- Command-line prompts and delimiter-conversion logic remain stable within Ruby 4.0.x / Python 3.14.x. Any breaking change will be announced in the README.
- Earlier interpreter majors are not tested and will not receive backports.

## Reporting a Vulnerability

Please report issues privately via **GitHub Security Advisory** (preferred) — open through the repository’s **Security → Report a vulnerability** workflow.

Acknowledgement occurs and status updates follow as soon as possible.  
After remediation we publish guidance alongside required dependency updates.
