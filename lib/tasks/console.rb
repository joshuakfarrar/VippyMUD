desc 'Fires up an interactive REPL using pry and the application environment loaded'
task console: :environment do
  app = VippyMUD::Application.new
  binding.pry
end