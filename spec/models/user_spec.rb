require 'spec_helper'

describe User do
	before :each do
		@user=FactoryGirl.create(:user) 
		@section1=Section.find_by_name("service_section1")
		@section2=Section.find_by_name("service_section2")
		@user.sections<<@section1
		@user.save
	end

	it "user should be redactor for section1" do
		@user.redactor?( @section1 ).should be_true
	end

	it "user should NOT be redactor for section2" do
		@user.redactor?( @section2 ).should_not be_true
	end

end
