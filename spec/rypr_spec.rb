require 'spec_helper'

describe Rypr::Connection do
  # This needs to be mocked out with VCR. It can't be
  # tested via the API every time.
  describe '#create_user' do
    context "with correct username and password" do
      before do
        @username = "tester+#{rand(5000)}@j-udy.com"
        @password = "password"
      end
      it "should return true" do
        Rypr::Connection.create_user(@username, @password).should == true
      end
    end
  end

  describe '.new' do
    before(:each) do
      @result = Rypr::Connection.new(CONFIG['test']['username'], CONFIG['test']['password'])
    end

    it "should return a new Rypr::Connection object" do
      @result.should be_an_instance_of(Rypr::Connection)
    end

    specify "the Rypr::Connection object should have a token" do
      @result.token.should_not be_nil
    end
  end


  # describe "#initialize" do
  #   context "when connection parameters are valid" do
  #     before do
  #       @result = Rypr::Connection.open_connection
  #     end
  #     it "should open the connection to the Zypr server" do
  #       @result.should == true
  #     end
  #   end
  # end

   #   context "when connection parameters are invalid" do
   #     before do
   #       class Rypr::Connection
   #         @@config["base_domain"] = "www.google.com"
   #       end
   #       @result = Rypr::Connection.open_connection
   #     end
   #     it "should not open the connection to the Zypr server" do
   #       @result.should == false
   #     end
   #   end
   # end
end
