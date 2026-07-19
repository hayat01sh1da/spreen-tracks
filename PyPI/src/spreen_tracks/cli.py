"""Command line interface behind the `track-delimiter` executable:
`track-delimiter [--extension EXT] [--delimiter CHAR] [--mode d|e]`."""

import argparse
import sys

from . import __version__
from .application import Application


def _build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog='track-delimiter',
        description='Rename media files so the space after the track number '
                    'becomes a configurable delimiter and N- disc prefixes '
                    'become DiscN/ subdirectories.')
    parser.add_argument(
        '--extension', default='.m4a', metavar='EXT',
        help='Target extension of the files to rename (default: .m4a)')
    parser.add_argument(
        '--delimiter', default='_', metavar='CHAR',
        help='Delimiter that replaces the space after the track number '
             '(default: _)')
    parser.add_argument(
        '--mode', choices=('d', 'e'), default='d',
        help='Execution mode (default: d for dry run; e executes the renames)')
    parser.add_argument('--version', action='version', version=__version__)
    return parser


def main(argv: list[str] | None = None) -> int:
    args = _build_parser().parse_args(argv)
    try:
        Application.run(extension=args.extension, delimiter=args.delimiter,
                        mode=args.mode)
    except Application.InvalidModeError as error:
        print(error, file=sys.stderr)
        return 1
    return 0


if __name__ == '__main__':
    sys.exit(main())
