import pytest

from spreen_tracks import __version__
from spreen_tracks.cli import main


def test_dry_run_by_default(
        base_dir: str, capsys: pytest.CaptureFixture[str]) -> None:
    status = main([])

    assert status == 0
    out = capsys.readouterr().out
    assert '[DRY RUN] Start!' in out
    assert '[EXECUTION]' not in out


def test_execution_mode_with_specific_delimiter(
        base_dir: str, capsys: pytest.CaptureFixture[str]) -> None:
    status = main(['--delimiter', '-', '--mode', 'e'])

    assert status == 0
    assert '[EXECUTION] Done!' in capsys.readouterr().out


def test_extension_option(capsys: pytest.CaptureFixture[str]) -> None:
    status = main(['--extension', '.mp3'])

    assert status == 0
    assert 'Target extension is `.mp3`' in capsys.readouterr().out


def test_invalid_mode() -> None:
    with pytest.raises(SystemExit):
        main(['--mode', 'a'])


def test_version(capsys: pytest.CaptureFixture[str]) -> None:
    with pytest.raises(SystemExit) as excinfo:
        main(['--version'])

    assert excinfo.value.code == 0
    assert capsys.readouterr().out == f'{__version__}\n'
