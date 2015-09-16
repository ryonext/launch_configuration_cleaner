require "thor"
require "launch_configuration_cleaner/agent"

module LaunchConfigurationCleaner
  class CLI < Thor
    default_task :execute

    desc "execute", "Fetch LaunchConfiguration list from AWS and you can choose which you want to remove."
    def execute
      agent = Agent.new
      agent.list_current_configurations
      delete_list = agent.ask_delete_target
      exit if delete_list.size == 0

      agent.list_delete_target(delete_list)

      while true do
        puts "Are you sure? (yes or no)"
        final_answer = gets.strip
        if final_answer == "yes"
          delete_list.each do |l|
            agent.client.delete_launch_configuration(launch_configuration_name: l.launch_configuration_name)
          end
          puts "LaunchConfiguration have been deleted."
          break
        elsif final_answer == "no"
          puts "Ok, canceled."
          break
        else
          puts "Sorry, I don't understand your answer."
        end
      end
    end
  end
end
