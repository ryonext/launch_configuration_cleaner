require "thor"

module LaunchConfigurationCleaner
  class CLI < Thor
    default_task :execute

    desc "execute", "hoge"
    def execute
      puts "hoge"
    end
  end
end
