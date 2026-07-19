# frozen_string_literal: true
# rbs_inline: enabled

require 'optparse'
require_relative 'version'
require_relative 'application'

module SpreenTracks
  # Command line interface behind the `track-delimiter` executable:
  # `track-delimiter [--extension EXT] [--delimiter CHAR] [--mode d|e]`.
  class CLI
    MODES = %w[d e].freeze #: Array[String]

    # @rbs argv: Array[String]
    # @rbs return: Integer
    def self.start(argv = ARGV)
      new(argv).run
    end

    # @rbs argv: Array[String]
    # @rbs return: void
    def initialize(argv)
      @argv      = argv.dup
      @extension = '.m4a'
      @delimiter = '_'
      @mode      = 'd'
      @action    = :replace_delimiters
    end

    # @rbs return: Integer
    def run
      parser.parse!(argv)
      __send__(action)
    rescue Application::InvalidModeError, OptionParser::ParseError => e
      warn e.message
      1
    end

    private

    attr_reader :argv #: Array[String]
    attr_reader :extension #: String
    attr_reader :delimiter #: String
    attr_reader :mode #: String
    attr_reader :action #: Symbol

    # @rbs return: Integer
    def replace_delimiters
      Application.run(extension:, delimiter:, mode:)
      0
    end

    # @rbs return: Integer
    def print_version
      puts VERSION
      0
    end

    # @rbs return: Integer
    def print_help
      puts parser
      0
    end

    # @rbs return: OptionParser
    def parser
      @parser ||= OptionParser.new('Usage: track-delimiter [options]') do |opt|
        replacement_options(opt)
        opt.on('--version', 'Print the version') { @action = :print_version }
        opt.on('-h', '--help', 'Print this help') { @action = :print_help }
      end
    end

    # @rbs opt: OptionParser
    # @rbs return: void
    def replacement_options(opt)
      opt.on('--extension EXT', 'Target extension of the files to rename (default: .m4a)') do |value|
        @extension = value
      end
      opt.on('--delimiter CHAR', 'Delimiter that replaces the space after the track number (default: _)') do |value|
        @delimiter = value
      end
      opt.on('--mode MODE', MODES,
             "Execution mode (#{MODES.join(' or ')}, default: d for dry run; e executes)") do |value|
        @mode = value
      end
    end
  end
end
