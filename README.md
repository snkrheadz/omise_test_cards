# OmiseTestCards

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omise_test_cards'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omise_test_cards

## Usage

You can get omise test cards collection set of an instance of Hashie::Mash by `OmiseTestCards.test_cards` .

Regarding to omise website [Tests](https://www.omise.co/api-testing) , there are 10 types of test card set by now( 2017-03-10 16:36:25 +0900 ) .

```ruby
cards = OmiseTestCards.test_cards

cards.successful_charge
cards.invalid_security_code
cards.fail_3ds_card_enrollment
cards.fail_3ds_card_validation
cards.insufficient_fund
cards.stolen_or_lost_card
cards.failed_processing
cards.payment_rejected
cards.failed_fraud_check
cards.invalid_account_number
```

See how to refer successful charge test cards below.

```ruby
cards = OmiseTestCards.test_cards

cards.successful_charge.code
# => successful_charge

cards.successful_charge.description
# => "these credit card numbers can be used in test mode"

cards.successful_charge.cards
# => <Hashie::Array [#<Hashie::Mash brand="Visa" number="4242424242424242">, #<Hashie::Mash brand="Visa" number="4111111111111111">, #<Hashie::Mash brand="MasterCard" number="5555555555554444">, #<Hashie::Mash brand="MasterCard" number="5454545454545454">, #<Hashie::Mash brand="JCB" number="3530111333300000">, #<Hashie::Mash brand="JCB" number="3566111111111113">]>

cards.successful_charge.cards.first.brand
# => Visa

cards.successful_charge.cards.first.number
# => 4242424242424242
```

## Quick Start

This is a simple way to test charge on test mode.

```ruby
require "omise"
require "omise_test_cards"

Omise.api_key = "SET_YOUR_TEST_SECRET_KEY"
Omise.vault_key = "SET_YOUR_TEST_PUBLIC_KEY"

# get sampla card
sampel_card = OmiseTestCards.test_cards.successful_charge.cards.first

begin
  # create token
  token = Omise::Token.create(card: {
    name: "TARO OMISE",
    number: sampel_card.number,
    expiration_month: 3,
    expiration_year: 2019,
    city: "Tokyo",
    postal_code: "1510051",
    security_code: 123
  })

  # Charge 100000 JPY
  charge = Omise::Charge.create({
    amount: 100_000,
    currency: "jpy",
    card: token.id
  })

  if charge.paid
    # handle success
    puts "thanks"
  else
    # handle failure
    raise charge.failure_code
  end
rescue OmiseError => e
  # handle OmiseError raised by omise library
  raise e.message
end
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/akinrt/omise_test_cards. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
