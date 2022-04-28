require_relative './app/app'

def main
  app = App.new
  app.welcome
  app.load_data
  app.console_start
end

main
