namespace :db do
  task :overhaul do
    Rake::Task["db:migrate:reset"].invoke
    Rake::Task["db:seed"].invoke
  end
end
