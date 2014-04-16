RSpec.configure do |config|
  config.include Features::SessionHelpers, type: :feature
  config.include Features::ReputationHelpers, type: :feature
  config.include Features::MailHelpers, type: :feature
end