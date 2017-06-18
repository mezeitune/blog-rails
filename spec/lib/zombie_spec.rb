require "spec_helper"
require "zombie"

describe Zombie do #todos los tests asociados al Fixture Zombie
	it "is named Ash" do #En Rspec se le llaman examples a esto , es donde ponemos el nombre del test
		zombie=Zombie.new
		zombie.name.should=="Ash"#expected
	end

	it "has no brains" do
		zombie=Zombie.new
		zombie.brains.should < 1
	end

	it "its hungry" do
		zombie=Zombie.new
		zombie.hungry?.should be_true # o sino una manera mas corta: zombie.should be_hungry
	end
end
