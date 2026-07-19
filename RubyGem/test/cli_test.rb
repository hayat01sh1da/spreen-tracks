# frozen_string_literal: true
# rbs_inline: enabled

require 'minitest/autorun'
require_relative '../lib/spreen_tracks'

class CLITest < Minitest::Test
  def setup
    @base_dir = File.join('.', 'test', 'Artist')
    fixture_paths.each do |path|
      FileUtils.mkdir_p(File.dirname(path))
      FileUtils.touch(path)
    end
  end

  def teardown
    FileUtils.rm_rf(File.join(base_dir))
  end

  def test_dry_run_by_default
    status = nil
    out, _err = capture_io { status = SpreenTracks::CLI.start([]) }

    assert_equal(0, status)
    assert_match(/\[DRY RUN\] Start!/, out)
    assert_equal [
      './test/Artist/Album1/1-01 Title.m4a',
      './test/Artist/Album1/2-01 Title.m4a',
      './test/Artist/Album2/01 Title.m4a',
      './test/Artist/Album2/02 Title.m4a',
      './test/Artist/Album3/01 Title.mp3'
    ], Dir[File.join(base_dir, '**', '*.*')]
  end

  def test_execution_mode_with_specific_delimiter
    status = nil
    out, _err = capture_io do
      status = SpreenTracks::CLI.start(['--delimiter', '-', '--mode', 'e'])
    end

    assert_equal(0, status)
    assert_match(/\[EXECUTION\] Done!/, out)
    assert_equal [
      './test/Artist/Album1/Disc1/01-Title.m4a',
      './test/Artist/Album1/Disc2/01-Title.m4a',
      './test/Artist/Album2/01-Title.m4a',
      './test/Artist/Album2/02-Title.m4a',
      './test/Artist/Album3/01 Title.mp3'
    ], Dir[File.join(base_dir, '**', '*.*')]
  end

  def test_extension_option
    status = nil
    out, _err = capture_io { status = SpreenTracks::CLI.start(['--extension', '.mp3']) }

    assert_equal(0, status)
    assert_match(/Target extension is `\.mp3`/, out)
  end

  def test_invalid_mode
    status = nil
    _out, err = capture_io { status = SpreenTracks::CLI.start(['--mode', 'a']) }

    assert_equal(1, status)
    assert_match(/invalid argument/, err)
  end

  def test_version
    status = nil
    out, _err = capture_io { status = SpreenTracks::CLI.start(['--version']) }

    assert_equal(0, status)
    assert_equal("#{SpreenTracks::VERSION}\n", out)
  end

  def test_help
    status = nil
    out, _err = capture_io { status = SpreenTracks::CLI.start(['--help']) }

    assert_equal(0, status)
    assert_match(/Usage: track-delimiter \[options\]/, out)
  end

  private

  attr_reader :base_dir

  # @rbs return: Array[String]
  def fixture_paths
    [
      File.join(base_dir, 'Album1', '1-01 Title.m4a'),
      File.join(base_dir, 'Album1', '2-01 Title.m4a'),
      File.join(base_dir, 'Album2', '01 Title.m4a'),
      File.join(base_dir, 'Album2', '02 Title.m4a'),
      File.join(base_dir, 'Album3', '01 Title.mp3')
    ]
  end
end
