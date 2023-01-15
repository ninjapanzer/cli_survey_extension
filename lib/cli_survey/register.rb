module CliSurvey::Register
  def self.register_commands
    #CliSurvey::Command::Survey
    CliSurvey::Command::Survey.register
  end
end