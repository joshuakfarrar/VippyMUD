namespace :db do
  desc "Migrate the active record database to the latest version"
  task migrate: :environment do
    app = VippyMUD::Application.new
    ActiveRecord::Migrator.migrate [app.root.join('db/migrate')]
  end
end