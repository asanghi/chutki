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

    chutki = Chutki.new(username,password,senderid)
    result = chutki.send_sms(phone_number,message)
    if result.success?
      ...
    else
      ...
    end
    # See documentation for all result codes

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
