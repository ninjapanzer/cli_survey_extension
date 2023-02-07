# frozen_string_literal: true

require_relative "cli_survey/version"
require "zeitwerk"
require 'thor'
require 'sqlite3'
require 'cli/toolkit/refinements'

loader = Zeitwerk::Loader.for_gem(warn_on_extra_files: false)
loader.setup

module CliSurvey
  CONFIG = {
    'surveyDir' => File.join(Dir.home,'.cli','surveyDir'),
  }
  class Error < StandardError; end

  class Start

  end
end

loader.eager_load_namespace(CliSurvey::Command)

CliSurvey::Command::Survey::Command.start(ARGV) if $0 == __FILE__
