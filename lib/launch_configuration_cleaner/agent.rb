require "aws-sdk"

module LaunchConfigurationCleaner
  class Agent
    def client
      @client ||= Aws::AutoScaling::Client.new
    end

    def launch_configurations
      @launch_configurations ||= client.describe_launch_configurations.launch_configurations
    end

    def list_current_configurations
      puts "These are your launch configurations"
      puts "["
      launch_configurations.each do |l|
        puts "  #{l.launch_configuration_name},"
      end
      puts "]"
    end

    def ask_delete_target
      launch_configurations.map do |l|
        puts "Do you want to delete #{l.launch_configuration_name}? (y/n)"
        answer = gets.strip
        if answer == "y"
          puts "Delete #{l.launch_configuration_name} later..."
          l
        end
      end.compact
    end

    def list_delete_target(delete_list)
      puts "These launch configurations will be deleted."
      puts "["
      delete_list.each do |l|
        puts "  #{l.launch_configuration_name},"
      end
      puts "]"
    end
  end
end
