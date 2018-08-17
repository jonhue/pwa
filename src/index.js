class ProgressiveWebApp {
  constructor(serviceWorkerPath = '/pwa-sw.js') {
    this._serviceWorkerPath = serviceWorkerPath;
    if (!navigator.serviceWorker.controller)
      navigator.serviceWorker.register(this.serviceWorkerUrl, { scope: './' });
  }

  get serviceWorkerPath() {
    return this._serviceWorkerPath;
  }
  set serviceWorkerPath(val) {
    this._serviceWorkerPath = val;
  }

  get serviceWorkerUrl() {
    return getBaseUrl() + this.serviceWorkerPath;
  }
}

function getBaseUrl(url = window.location) {
  return url.protocol + '//' + url.host + '/' + url.pathname.split('/')[1];
}

export default ProgressiveWebApp;
