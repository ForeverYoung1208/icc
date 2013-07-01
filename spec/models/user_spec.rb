require 'spec_helper'

describe User do
	it "should save new user" do
		@user=FactoryGirl.create(:user) 
	end
end
