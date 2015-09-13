require "spec_helper"

describe LaunchConfigurationCleaner::Agent do
  let(:agent) { LaunchConfigurationCleaner::Agent.new }

  describe "#list_current_configurations" do
    subject { agent.list_current_configurations }
    before do
      mob = Struct.new("Mob", :launch_configuration_name)
      allow_any_instance_of(LaunchConfigurationCleaner::Agent).to receive(:launch_configurations).and_return([mob.new("config1"), mob.new("config2"), mob.new("config3")])
    end

    it "returns configuration list." do
      expect { subject }.to output(
<<MESSAGE
These are your launch configurations
[
  config1,
  config2,
  config3,
]
MESSAGE
      ).to_stdout
    end
  end

  describe "#ask_delete_target" do
    subject { agent.ask_delete_target }

    before do
      mob = Struct.new("Mob", :launch_configuration_name)
      allow_any_instance_of(LaunchConfigurationCleaner::Agent).to receive(:launch_configurations).and_return([mob.new("config1"), mob.new("config2"), mob.new("config3")])
      allow_any_instance_of(LaunchConfigurationCleaner::Agent).to receive(:gets).and_return(*%w(y n y))
    end

    it "asks which configuration will be deleted" do
      expect { subject }.to output(
<<OUTPUT
Do you want to delete config1? (y/n)
Delete config1 later...
Do you want to delete config2? (y/n)
Do you want to delete config3? (y/n)
Delete config3 later...
OUTPUT
      ).to_stdout
    end

    it "returns to delete list." do
      expect(subject.map(&:launch_configuration_name)).to eq %w( config1 config3 )
    end
  end

  describe "#list_delete_target" do
    subject { agent.list_delete_target(list) }
    let(:list){
      mob = Struct.new("Mob", :launch_configuration_name)
      [ mob.new("config1"), mob.new("config3") ]
    }

    it "shows list to delete " do
      expect { subject }.to output(
<<OUTPUT
These launch configurations will be deleted.
[
  config1,
  config3,
]
OUTPUT
      ).to_stdout
    end
  end
end
