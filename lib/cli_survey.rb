# frozen_string_literal: true

require_relative "cli_survey/version"
require "zeitwerk"
require 'thor'
require 'sqlite3'

loader = Zeitwerk::Loader.for_gem(warn_on_extra_files: false)
loader.setup

module CliSurvey
  class Error < StandardError; end
  # Your code goes here...
end

loader.eager_load_dir("#{__dir__}/cli_survey/command")

# CliSurvey::Command::Survey.start(ARGV)