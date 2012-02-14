require 'spec_helper'

describe Zypr do
  # # This needs to be mocked out with VCR. It can't be
  # # tested via the API every time.
  # describe '#create_user' do
  #   context "with correct username and password" do
  #     it "should return true" do
  #       Zypr.create_user("clintononon@j-udy.com", "password").should == true
  #     end
  #   end
  # end

  describe '.new' do
    before(:each) do
      @result = Zypr.new(CONFIG['test']['username'], CONFIG['test']['password'])
    end

    it "should return a new Zypr object" do
      @result.should be_an_instance_of(Zypr)
    end
  end


  # describe "#initialize" do
  #   context "when connection parameters are valid" do
  #     before do
  #       @result = Zypr.open_connection
  #     end
  #     it "should open the connection to the Zypr server" do
  #       @result.should == true
  #     end
  #   end
  # end

   #   context "when connection parameters are invalid" do
   #     before do
   #       class Zypr
   #         @@config["base_domain"] = "www.google.com"
   #       end
   #       @result = Zypr.open_connection
   #     end
   #     it "should open the connection to the Zypr server" do
   #       @result.should == false
   #     end
   #   end
   # end
end
