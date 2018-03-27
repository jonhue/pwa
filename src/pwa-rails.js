class ProgressiveWebApp {

    constructor( serviceWorkerPath = '/pwa-sw.js' ) {
        this._serviceWorkerPath = serviceWorkerPath;
        if (navigator.serviceWorker.controller) {
            console.log('[PWA] Active service worker found')
        } else {
            navigator.serviceWorker.register( this.serviceWorkerUrl, { scope: './' }).then(function(reg) {
                console.log( '[PWA] ServiceWorker registration successful with scope: ', reg.scope );
            }, function(err) {
                console.log( '[PWA] ServiceWorker registration failed: ', err );
            });
        }
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


function getBaseUrl( url = window.location ) {
    return url.protocol + '//' + url.host + '/' + url.pathname.split('/')[1];
}

export default ProgressiveWebApp;
