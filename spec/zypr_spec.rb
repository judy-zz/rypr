require 'spec_helper'

describe Zypr do
	describe ".open_connection" do
    context "when connection parameters are valid" do
      before do
        @result = Zypr.open_connection
      end
      it "should open the connection to the Zypr server" do
        @result.should == true
      end
    end
    context "when connection parameters are invalid" do
      before do
        class Zypr
          @@config["base_domain"] = "www.google.com"
        end
        @result = Zypr.open_connection
      end
      it "should open the connection to the Zypr server" do
        @result.should == false
      end
    end
	end
end
