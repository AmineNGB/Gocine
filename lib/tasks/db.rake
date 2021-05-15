namespace :db do
  namespace :import do
    desc "Import production Database"
    task production: :environment do
      cmd = "rails db:drop;"
      cmd += "heroku pg:pull postgresql-elliptical-13319 Gocine_development --app goocine;"
      cmd += "rails db:create db:migrate RAILS_ENV=test"
      sh cmd
    end
  end
end
