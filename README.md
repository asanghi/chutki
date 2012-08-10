# Chutki

Chutki sends SMS thru ProSMS Easy2Approach

## Installation

Add this line to your application's Gemfile:

    gem 'chutki'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chutki

## Usage

    chutki = Chutki.new({user: username, password: password, sender: sender_id})
    result = chutki.send_sms(phone_number,message)
    if result.success?
      ...
    else
      ...
    end
    # See documentation for all result codes

## For using this as an ActionMailer delivery method

    in your config/initializers/chutki.rb

    ActionMailer::Base.add_delivery_method :chutki, Chutki, {
      user: "username",
      password: "password",
      sender: "sender_id"
    }

    in your app/mailer/yourmailer.rb

    def welcome_sms(user)
      mail :to => user.phone, :delivery_method => :chutki
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
