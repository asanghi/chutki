require 'test_helper'

class InitTest < Test::Unit::TestCase

  context "Initialization" do

    should "require username and password and senderid" do
      lambda { Chutki.new }.should raise_error(ArgumentError)
      Chutki.new("username","password","senderid")
    end
  end

  context "making remote calls" do
    setup do
      @response = "ok"
      Chutki.stubs(:post).returns(@response)
    end

    context "Sending SMS" do
      @chutki = Chutki.new("username","password","senderid")
      Chutki.expects(:post).with("/sendhttp.php",:message => "message", :mobiles => "phonenumber", :senderid => "senderid", :user => "username", :password => "password")
      @chutki.send_sms("message","phonenumber")
    end

  end

end