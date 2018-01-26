**Thank you for installing Progressive Web Apps for Rails!**


There are two more steps to take:

1) Run `rails g pwa:install` and `rails g pwa:install -n "Application Name"`
2) Mount engine in `config/routes.rb`:

    mount Pwa::Engine, at: ''


Learn more at https://github.com/jonhue/pwa
