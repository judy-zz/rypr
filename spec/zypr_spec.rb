require 'spec_helper'

describe Zypr do
	describe ".open_connection" do
    before do
      @result = Zypr.open_connection
    end
    it "should open the connection to the Zypr server" do
      @result.should == true
    end
	end
end
