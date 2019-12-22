# Progressive Web Apps for Rails

This gem only provides a foundation upon which you can build your Progressive Web App. It simplifies adding a service worker and a manifest to your app, so that it can be recognized as an PWA and as such accessed without a network connection.

[Google](https://developers.google.com/web/progressive-web-apps/) defines Progressive Web Apps as:

* **Reliable** - Load instantly and never show the downasaur, even in uncertain network conditions.
    * This is handled by Progressive Web Apps for Rails.
* **Fast** - Respond quickly to user interactions with silky smooth animations and no janky scrolling.
    * There are two technologies helping you with performance: *Turbolinks* & *AMP*. When you are using Turbolinks, use [TurbolinksAnimate](https://github.com/jonhue/turbolinks-animate) to get XHR requests + smooth page transitions that add some delight to using to your app. If you want to use AMP, take a look at [amp-html](https://github.com/jonhue/amp-html), an Accelerated Mobile Pages library for Rails apps.
* **Engaging** - Feel like a natural app on the device, with an immersive user experience.
    * When you think about making your app more engaging, you can't get around user-notifications. OneSignal is a powerful (& free) solution. With [OnSignal](https://github.com/jonhue/onsignal) and [notification-pusher-onesignal](https://github.com/jonhue/notifications-rails/tree/master/notification-pusher/notification-pusher-onesignal) adding native notification capabilities to your app becomes dead simple.

---

If a PWA is not enough and you want to bring your Web App into the store - check out [NativeGap](https://github.com/NativeGap/nativegap-rails).

---

## Table of Contents

* [Installation](#installation)
* [Usage](#usage)
  * [Quick start](#quick-start)
  * [Apps](#apps)
    * [Manifest](#manifest)
    * [Offline pages](#offline-pages)
  * [Themes](#themes)
  * [Service worker](#service-worker)
  * [Styles](#styles)
* [Configuration](#configuration)
* [Release](#release)
* [Contributing](#contributing)
  * [Semantic versioning](#semantic-versioning)

---

## Installation

Progressive Web Apps for Rails works with Rails 5 onwards. You can add it to your `Gemfile` with:

```ruby
gem 'pwa'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pwa

If you always want to be up to date fetch the latest from GitHub in your `Gemfile`:

```ruby
gem 'pwa', github: 'jonhue/pwa'
```

---

## Usage

### Quick start

Run the generators:

    $ rails g mozaic:install
    $ rails g pwa:install
    $ rails g pwa:app -n "App"

Now define your app:

```ruby
Pwa.configure do |config|
  config.define_app 'App'
end
```

Add the following to the `head` tag of your layout file:

```haml
= component 'pwa/manifest', url: request.base_url
```

Now add the `pwa-rails` NPM package and initialize it:

```js
import ProgressiveWebApp from 'pwa-rails';
document.addEventListener('turbolinks:load', () => {
  const progressiveWebApp = new ProgressiveWebApp();
})
```

**Note:** If the name of the service worker is not the default `/pwa-sw.js` you can specify a custom path: `new ProgressiveWebApp('/custom-path.js')`

Lastly, go to your routes file (`config/routes.rb`) and mount the `Pwa::Engine` class:

```ruby
mount Pwa::Engine, at: ''
```

**Note:** The path `Pwa::Engine` is being mounted at, is currently required to be `''`.

### Apps

Progressive Web Apps for Rails allows for multiple Progressive Web Apps per Rails app:

```ruby
Pwa.configure do |config|
  config.define_app 'Subdomain', ['subdomain.example.com', 'subdomain.lvh.me:3000']
  config.define_app 'Example', ['example.com', 'localhost:3000', 'lvh.me:3000']
end
```

**Note:** You can omit the array of URL scopes if you have just one PWA.

When looking for an app, the first app specified with a matching scope will be used.

#### Manifest

The app generator generates a manifest file located in the `app/views/pwa/apps/manifests` directory. It is accessible through `/manifest.json`. You can customize it to your liking.

#### Offline pages

Progressive Web Apps for Rails automatically stores a copy of the offline page (`app/views/pwa/apps/offline/_app.html.erb`) in the users cache, so your app is accessible at all times, even if requested URLs have not been cached yet.

### Themes

Progressive Web Apps for Rails simplifies adding themes reflected in browsers to your site. Add the following to the `head` tag in your layout file:

```haml
= component 'pwa/theme', default: '#000000'
```

**Note:** `default` falls back to `#FFFFFF`.

You can now override the default theme color from your views:

```haml
- area :pwa_theme, '#FF0000'
```

### Service worker

The generator also generates a service worker which caches visited pages to the local storage so they can get accessed even if the device has no network connection.

You can customize the page that shows up when a requested page has not been cached by editing the contents of `app/views/pwa/offline/index.html.erb`

**Note:** When using Progressive Web Apps for Rails with a service worker provided by a third party service like OneSignal, remove the NPM package and manually import your apps service worker in the third party script:

```js
importScripts('https://example.com/pwa-sw.js');
```

### Styles

To detect whether or not your app is currently being used as a Progressive Web App, you can use CSS media queries:

```css
@media all and (display-mode: standalone) {
  /* ... */
}
```

**Note:** Make sure to use `fullscreen` instead of `standalone` if that is your PWA display mode.

---

## Configuration

You can configure Pwa by passing a block to `configure`. This can be done in `config/initializers/pwa.rb`:

```ruby
Pwa.configure do |config|
  config.define_app 'App', ['example.com']
end
```

* `define_app` Define apps with a name and URL scopes.

---

## Release

1. Review breaking changes and deprecations in `CHANGELOG.md`.
1. Change the version in `package.json` and `lib/pwa/version.rb`.
1. Reset `CHANGELOG.md`.
1. Create a pull request to merge the changes into `master`.
1. After the pull request was merged, create a new release listing the breaking changes and commits on `master` since the last release.
1. The release workflow will publish the node package to NPM and GPR and the gem to Rubygems and GPR.

---

## Contributing

We hope that you will consider contributing to Progressive Web Apps for Rails. Please read this short overview for some information about how to get started:

[Learn more about contributing to this repository](CONTRIBUTING.md), [Code of Conduct](CODE_OF_CONDUCT.md)

### Semantic Versioning

Progressive Web Apps for Rails follows Semantic Versioning 2.0 as defined at http://semver.org.
