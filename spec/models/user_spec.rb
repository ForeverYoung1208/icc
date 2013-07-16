require 'spec_helper'

describe User do
	before :each do
		@user=FactoryGirl.create(:user) 
		@section1=Section.find_by_name("service_section1")
		@section2=Section.find_by_name("service_section2")
		@user.sections<<@section1
		@user.save

		@admin=FactoryGirl.create(:user) 
		@admin.sections=Section.all
	end



	it "user should be redactor for section1" do
		@user.redactor?( @section1 ).should be_true
	end

	it "user should NOT be redactor for section2" do
		@user.redactor?( @section2 ).should_not be_true
	end

	it "should raise an exception when the 'nil' given for redactor check" do
		expect { @user.redactor?(nil) }.to raise_error('no section given')
	end


	it "admin should respond true on admin?" do
		@admin.admin?.should be_true
	end

	it "user should respond false on admin?" do
		@user.admin?.should be_false
	end






end
