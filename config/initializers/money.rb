# encoding : utf-8
require "money/bank/google_currency"

MoneyRails.configure do |config|

  config.default_currency = :usd

  Money::Bank::GoogleCurrency.ttl_in_seconds = 86400

  config.default_bank = Money::Bank::GoogleCurrency.new

  config.include_validations = true

  config.amount_column = { prefix: "",           # column name prefix
                           postfix: "_cents",    # column name  postfix
                           column_name: nil,     # full column name
                           type: :integer,       # column type
                           present: true,        # column will be created
                           null: false,          # other options will be treated as column options
                           default: 0
                         }

  config.currency_column = { prefix: "",
                             postfix: "_currency",
                             column_name: nil,
                             type: :string,
                             present: true,
                             null: false,
                             default: "USD"
                           }
end
