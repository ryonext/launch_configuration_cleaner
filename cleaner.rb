require "bundler"
Bundler.require

def autoscaling
  @autoscaling ||= Aws::AutoScaling::Client.new(region: 'ap-southeast-1')
end

def launch_configurations
  @autoscaling.describe_launch_configurations.launch_configurations
end

launch_configurations.each do |l|
  puts l.launch_configuration_name
end
