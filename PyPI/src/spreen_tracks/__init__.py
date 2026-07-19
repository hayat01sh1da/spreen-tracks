"""Spreens a music library — the falcon's stoop, then the preen: walks the
current directory for media files with a given extension and rewrites their
filenames so the space after the track number becomes a configurable
delimiter and ``N-`` disc prefixes become ``DiscN/`` subdirectories."""

from .application import Application

__version__ = '0.1.0'

__all__ = [
    'Application',
    '__version__',
]
