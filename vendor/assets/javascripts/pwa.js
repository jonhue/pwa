if (navigator.serviceWorker.controller) {
    console.log('[PWA] Active service worker found')
} else {
    navigator.serviceWorker.register( '/pwa-sw.js', { scope: './' }).then(function(reg) {
        console.log( '[PWA] ServiceWorker registration successful with scope: ', reg.scope );
    }, function(err) {
        console.log( '[PWA] ServiceWorker registration failed: ', err );
    });
}
