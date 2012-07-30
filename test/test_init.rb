require 'test_helper'

class InitTest < Test::Unit::TestCase

  context "Initialization" do

    should "require username and password and senderid" do
      lambda { Chutki.new }.should raise_error(ArgumentError)
      Chutki.new({username: "username", password: "password", sender_id: "senderid"})
    end
  end

  context "making remote calls" do
    setup do
      @response = "ok"
      Chutki.stubs(:post).returns(@response)
    end

    context "Sending SMS" do
      @chutki = Chutki.new({username: "username", password: "password", sender_id: "senderid"})
      Chutki.expects(:post).with("/sendhttp.php", :mobiles => "phonenumber", :message => "message", :username => "username", :password => "password", :sender_id => "senderid")
      @chutki.send_sms("message","phonenumber",{})
    end

  end

end