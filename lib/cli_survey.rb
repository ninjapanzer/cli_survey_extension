# frozen_string_literal: true

require_relative "cli_survey/version"
require "zeitwerk"
require 'thor'
require 'sqlite3'

loader = Zeitwerk::Loader.for_gem(warn_on_extra_files: false)
loader.setup

module CliSurvey
  CONFIG = {
    'surveyDir' => File.join(Dir.home,'.cli','surveyDir'),
  }
  class Error < StandardError; end
  # Your code goes here...

  class Start

  end
end

# loader.eager_load_dir("#{__dir__}/cli_survey/command")

CliSurvey::Command::Survey::Command.start(ARGV) if $0 == __FILE__
