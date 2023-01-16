module CliSurvey::Register
  def self.register_commands
    CliSurvey::Command::Survey::Command.register_command
  end
end