require 'test_helper'

class InitTest < Test::Unit::TestCase

  context "Initialization" do

    should "require username and password" do
      lambda { Chutki.new }.should raise_error(ArgumentError)
      Chutki.new("username","password","senderid")
    end
  end

end