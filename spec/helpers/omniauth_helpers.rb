module OmniauthHelpers
  def twitter_auth_hash(custom: {})
    {
      "provider" => custom[:provider] || "twitter",
      "uid" =>      custom[:uid]      || Faker::Number.number(20),
      "info" => {
        "name" =>     custom[:name]     || Faker::Internet.user_name,
        "email" =>    custom[:email]    || Faker::Internet.email,
        "location" => custom[:location] || Faker::Address.city,
        "image" =>    custom[:image]    || Faker::Placeholdit.image("50x50"),
        "urls" =>     custom[:urls]     || { "Twitter" => Faker::Internet.url }
      },
      "credentials" => {
        "token" => custom[:token] || Faker::Bitcoin.address
      },
      "extra" => {
        "raw_info" => {
          "lang" => custom[:lang] || "en"
        }
      }
    }
  end
end
