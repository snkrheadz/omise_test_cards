module OmiseTestCards
  class Cards
    attr_reader :test_cards

    def initialize
      @test_cards ||= Hashie::Mash.new(hash_cards)
    end

    private

    def hash_cards
      {
        successful_charge: {
          code: "successful_charge",
          description: "these credit card numbers can be used in test mode",
          cards: [
            { brand: "Visa", number: "4242424242424242" },
            { brand: "Visa", number: "4111111111111111" },
            { brand: "MasterCard", number: "5555555555554444" },
            { brand: "MasterCard", number: "5454545454545454" },
            { brand: "JCB", number: "3530111333300000" },
            { brand: "JCB", number: "3566111111111113" },
          ],
        },
        invalid_security_code: {
          code: "invalid_security_code",
          description: "charge will fail with the invalid_security_code failure code. Additionaly the security_code_check attribute on the card object will be set to false",
          cards: [
            { brand: "Visa", number: "4111111111160001" },
            { brand: "Mastercard", number: "5555551111130001" },
            { brand: "JCB", number: "3530111111110001" },
          ],
        },
        fail_3ds_card_enrollment: {
          code: "payment_rejected",
          description: "charge will fail with the payment_rejected failure code because the card could not be enrolled with 3DS",
          cards: [
            { brand: "Visa", number: "4111111111150002" },
            { brand: "Mastercard", number: "5555551111120002" },
            { brand: "JCB", number: "3530111111100002" },
          ],
        },
        fail_3ds_card_validation: {
          code: "payment_rejected",
          description: "charge will fail with the payment_rejected failure code because the card could not be validated with 3DS",
          cards: [
            { brand: "Visa", number: "4111111111140003" },
            { brand: "Mastercard", number: "5555551111110003" },
            { brand: "JCB", number: "3530111111190003" },
          ],
        },
        insufficient_fund: {
          code: "insufficient_fund",
          description: "charge will fail with the insufficient_fund failure code",
          cards: [
            { brand: "Visa", number: "4111111111140011" },
            { brand: "Mastercard", number: "5555551111110011" },
            { brand: "JCB", number: "3530111111190011" },
          ],
        },
        stolen_or_lost_card: {
          code: "stolen_or_lost_card",
          description: "charge will fail with stolen_or_lost_card failure code",
          cards: [
            { brand: "Visa", number: "4111111111130012" },
            { brand: "Mastercard", number: "5555551111100012" },
            { brand: "JCB", number: "3530111111180012" },
          ],
        },
        failed_processing: {
          code: "failed_processing",
          description: "charge will fail with the failed_processing failure code",
          cards: [
            { brand: "Visa", number: "4111111111120013" },
            { brand: "Mastercard", number: "5555551111190013" },
            { brand: "JCB", number: "3530111111170013" },
          ],
        },
        payment_rejected: {
          code: "payment_rejected",
          description: "charge will fail with the payment_rejected failure code",
          cards: [
            { brand: "Visa", number: "4111111111110014" },
            { brand: "Mastercard", number: "5555551111180014" },
            { brand: "JCB", number: "3530111111160014" },
          ],
        },
        failed_fraud_check: {
          code: "failed_fraud_check",
          description: "charge will fail with failed_fraud_check failure code",
          cards: [
            { brand: "Visa", number: "4111111111190016" },
            { brand: "Mastercard", number: "5555551111160016" },
            { brand: "JCB", number: "3530111111140016" },
          ],
        },
        invalid_account_number: {
          code: "invalid_account_number",
          description: "charge will fail with invalid_account_number failure code",
          cards: [
            { brand: "Visa", number: "4111111111180017" },
            { brand: "Mastercard", number: "5555551111150017" },
            { brand: "JCB", number: "3530111111130017" },
          ],
        },
      }
    end
  end
end
