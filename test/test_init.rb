require 'test_helper'

class InitTest < Test::Unit::TestCase

  context "Initialization" do

    should "can accept username and password and senderid" do
      Chutki.new({user: "username", password: "password", sender: "senderid"})
    end
  end

  context "Settings" do
    should "allow settings to be updated" do
      chutki = Chutki.new
      o = {user: "username", password: "password", sender: "senderid"}
      chutki.settings!(o)
      chutki.options[:user].should equal(o[:user])
      chutki.options[:sender].should equal(o[:sender])
      chutki.options[:password].should equal(o[:password])
    end
  end

  context "making remote calls" do
    setup do
      @response = "ok"
      Chutki.stubs(:post).returns(@response)
    end

    context "Sending SMS" do
      @chutki = Chutki.new({user: "username", password: "password", sender: "senderid"})
      @chutki.class.expects(:post).with("/sendhttp.php", :query => {:mobiles => "phonenumber", :message => "message", :user => "username", :password => "password", :sender => "senderid"})
      @chutki.send_sms("message","phonenumber",{})
    end

  end

end