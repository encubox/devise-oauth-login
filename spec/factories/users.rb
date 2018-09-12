FactoryBot.define do
  factory :user, class: User do
    email { "#{SecureRandom.uuid}@example.tld" }
    password 'password'

    # trait(:admin) do
    #   admin true
    # end
  end
end
