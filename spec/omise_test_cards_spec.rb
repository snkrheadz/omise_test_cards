require "spec_helper"

RSpec.describe OmiseTestCards do
  it "has a version number" do
    expect(OmiseTestCards::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(false)
  end

  it "returns an instance Hashie::Mash" do
    expect(OmiseTestCards.test_cards).to be_an_instance_of(Hashie::Mash)
  end

  it "has a successful charge test card brand Visa and number 4242424242424242" do
    card = OmiseTestCards.test_cards.successful_charge.cards.first
    expect(card.brand).to eq("Visa")
    expect(card.number).to eq("4242424242424242")
  end

  it "has a invalid security code test card brand Visa and number 4111111111160001" do
    card = OmiseTestCards.test_cards.invalid_security_code.cards.first
    expect(card.brand).to eq("Visa")
    expect(card.number).to eq("4111111111160001")
  end

  it "has a fail 3ds card enrollment code test card brand Visa and number 4111111111150002" do
    card = OmiseTestCards.test_cards.fail_3ds_card_enrollment.cards.first
    expect(card.brand).to eq("Visa")
    expect(card.number).to eq("4111111111150002")
  end

  it "has a fail 3ds card validation test card brand Visa and number 4111111111140003" do
    card = OmiseTestCards.test_cards.fail_3ds_card_validation.cards.first
    expect(card.brand).to eq("Visa")
    expect(card.number).to eq("4111111111140003")
  end

  it "has a insufficient fund test card brand Visa and number 4111111111140011" do
    card = OmiseTestCards.test_cards.insufficient_fund.cards.first
    expect(card.brand).to eq("Visa")
    expect(card.number).to eq("4111111111140011")
  end

  it "has a stolen or lost card test card brand Visa and number 4111111111130012" do
    card = OmiseTestCards.test_cards.stolen_or_lost_card.cards.first
    expect(card.brand).to eq("Visa")
    expect(card.number).to eq("4111111111130012")
  end

  it "has a failed processing test card brand Visa and number 4111111111120013" do
    card = OmiseTestCards.test_cards.failed_processing.cards.first
    expect(card.brand).to eq("Visa")
    expect(card.number).to eq("4111111111120013")
  end

  it "has a payment rejected test card brand Visa and number 4111111111110014" do
    card = OmiseTestCards.test_cards.payment_rejected.cards.first
    expect(card.brand).to eq("Visa")
    expect(card.number).to eq("4111111111110014")
  end

  it "has a failed fraud check test card brand Visa and number 4111111111190016" do
    card = OmiseTestCards.test_cards.failed_fraud_check.cards.first
    expect(card.brand).to eq("Visa")
    expect(card.number).to eq("4111111111190016")
  end

  it "has a invalid account number test card brand Visa and number 4111111111180017" do
    card = OmiseTestCards.test_cards.invalid_account_number.cards.first
    expect(card.brand).to eq("Visa")
    expect(card.number).to eq("4111111111180017")
  end
end
