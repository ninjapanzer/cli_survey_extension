module CliSurvey::Register
  def self.call
    CliSurvey::Command::Survey::Command.register_command
  end
end