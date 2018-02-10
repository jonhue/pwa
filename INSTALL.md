**Thank you for installing Progressive Web Apps for Rails!**


There are three more steps to take:

1) Run `rails g pwa:install` and `rails g pwa:install -n "Application Name"`
2) Include the manifest component in your head tag:

    <%= component 'pwa/manfest' %>

3) Mount engine in `config/routes.rb`:

    mount Pwa::Engine, at: ''


Learn more at https://github.com/jonhue/pwa
