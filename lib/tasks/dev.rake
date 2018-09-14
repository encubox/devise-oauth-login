# For creation of db records in development environment.
# Not to be used in production.

if Rails.env == 'development'
  def dev_get_amount(args)
    args[:num].present? ? args[:num].to_i : 100
  end

  namespace :dev do
    task dusers: :environment do
      User.destroy_all
    end

    task :user, [:email] => :environment do |t, args|
      email = args[:email].present? ? args[:email] : 'user@example.com'
      FactoryBot.create :user, email: email, password: 'password'
    end

    # task :admin, [:email] => :environment do |t, args|
    #   email = args[:email].present? ? args[:email] : 'user@example.com'
    #   FactoryBot.create :user, :admin, email: email, password: 'password'
    # end

    # task :organizations, [:num] => :environment do |t, args|
    #   FactoryBot.create_list(:organization, dev_get_amount(args), :with_logo)
    # end

    # task dorganizations: :environment do
    #   Organization.destroy_all
    # end
  end
end
