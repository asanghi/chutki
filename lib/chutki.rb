require 'httparty'

class Chutki
  VERSION = "0.0.1"

  include HTTParty
  base_uri "http://prosms.easy2approach.com"

  def initialize(username,password,sender_id)
    @username = username
    @password = password
    @sender_id = sender_id
  end

  def send_sms(message,to,opts = {})
    opts ||= {}
    opts[:mobiles] = to
    opts[:message] = message
    opts[:senderid] = @sender_id
    self.class.post("/sendhttp.php",opts)
  end

  def check_dnd_balance
    balance("dnd")
  end

  def voice_balance
    balance("voice")
  end

  def balance(type = nil)
    opts = {}
    if type && (["dnd","voice"].include?(type))
      opts[:type] = type
    end
    makesned("/api/balance.php",opts)
  end

  def change_password(new_password)
    makesend("/api/change_password.php",{:newpass => new_password})
  end

  def validation
    makesend("/api/validate.php")
  end

  def check_delivery_report(msgid)
    makesend("/api/check_delivery.php",:msgid => msgid)
  end

  private

    def makesend(endpoint,opts = {})
      self.class.posts(endpoint,opts.merge(options))
    end

    def options
      {:user => @username, :password => @password}
    end

end