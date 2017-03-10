#! ruby -I ./
require "hashie"
require "omise_test_cards/version"
require "omise_test_cards/cards"

module OmiseTestCards
  def self.test_cards
    @test_cards ||= Cards.new.test_cards
  end

  def self.define_test_cards_to_omise
    if Object.const_defined?(:Omise)
      Omise.define_singleton_method(:test_cards) { @test_cards ||= Cards.new.test_cards }
    else
      puts "you need to require 'omise' then try it again"
    end
  end
end
