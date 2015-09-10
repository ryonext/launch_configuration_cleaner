require "bundler"
Bundler.require

def client
  @client ||= Aws::AutoScaling::Client.new(region: 'ap-southeast-1')
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

delete_list = ask_delete_target
exit if delete_list.size == 0

list_delete_target(delete_list)

while true do
  puts "Are you sure? (yes or no)"
  final_answer = gets.strip
  if final_answer == "yes"
    delete_list.each do |l|
      client.delete_launch_configuration(launch_configuration_name: l.launch_configuration_name)
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
