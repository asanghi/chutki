require 'chutki/version'
require 'httparty'

class Chutki
  include HTTParty
  base_uri "http://prosms.easy2approach.com"

  def initialize(options)
    @options = options
    @username = options[:user]
    @password = options[:password]
    @sender_id = options[:sender]
  end

  def send_sms(message,to,opts = {})
    opts ||= {}
    opts[:mobiles] = to
    opts[:message] = message
    makesend("/sendhttp.php",opts)
  end

  def deliver(mail)
    send_sms(mail.body,mail.to[0])
  end

  def deliver!(mail)
    deliver(mail)
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
    makesend("/api/balance.php",opts)
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
      self.class.post(endpoint,:query => {opts.merge(@options)})
    end

end