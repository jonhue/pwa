# Progressive Web Apps for Rails

[![Gem Version](https://badge.fury.io/rb/pwa.svg)](https://badge.fury.io/rb/pwa) <img src="https://travis-ci.org/jonhue/pwa.svg?branch=master" />

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
* [To Do](#to-do)
* [Contributing](#contributing)
    * [Contributors](#contributors)
    * [Semantic versioning](#semantic-versioning)
* [License](#license)

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
document.addEventListener( 'turbolinks:load', () => {
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

## To Do

[Here](https://github.com/jonhue/pwa/projects/1) is the full list of current projects.

To propose your ideas, initiate the discussion by adding a [new issue](https://github.com/jonhue/pwa/issues/new).

---

## Contributing

We hope that you will consider contributing to Progressive Web Apps for Rails. Please read this short overview for some information about how to get started:

[Learn more about contributing to this repository](CONTRIBUTING.md), [Code of Conduct](CODE_OF_CONDUCT.md)

### Contributors

Give the people some :heart: who are working on this project. See them all at:

https://github.com/jonhue/pwa/graphs/contributors

### Semantic Versioning

Progressive Web Apps for Rails follows Semantic Versioning 2.0 as defined at http://semver.org.

## License

MIT License

Copyright (c) 2018 Jonas Hübotter

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
