require_relative './app/app'

def main
  app = App.new
  app.load_data
  app.console_start
end

main
