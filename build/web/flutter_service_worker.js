'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/abstarct2.mp4": "554ee10b052cd036ba2d01bb9f7c85db",
"assets/abstract1.mp4": "0b0d8edc37e766fd88d3ea97eb80f0ff",
"assets/AssetManifest.bin": "091e97dbf8c4a0c3c16d4d80cfd8d7ec",
"assets/AssetManifest.bin.json": "9bc5a03a0fc6b28ec203a6619532836e",
"assets/AssetManifest.json": "f2afef6e679cfbbcaa41a2fefbd3d467",
"assets/assets/images/api.png": "995f76402869289a5e21df8cb383328e",
"assets/assets/images/app_devlop1.png": "a350027e528345ce95aa5deaecc6aea2",
"assets/assets/images/app_devlop2.png": "b5e00b7fe79781027dc999f38f62823d",
"assets/assets/images/bug-fix.png": "e3277727b9b5f4cd22ed9c5e6481a972",
"assets/assets/images/bug_fix.png": "eee25d247e212276edab9a2d591a152e",
"assets/assets/images/call.png": "3dbdf849dc65e10fe6febd41d63b6829",
"assets/assets/images/deployment.png": "5d27e3ff61d5d6ea43ae5a91eed085c8",
"assets/assets/images/facebook.png": "f9ffe7a2f9b99179d795c5713ea35956",
"assets/assets/images/feature_enhance.png": "41ad4b7b66ca99810de6bca12b21a678",
"assets/assets/images/git.png": "53d70230d253fd28fad50056e1693306",
"assets/assets/images/instagram.png": "5c570427ee23f69853d28aec805eee79",
"assets/assets/images/linkedin.png": "30c453b7f5fbdb09ea0cb42a5dc7a6e5",
"assets/assets/images/mobile.png": "419a781aca9819a514b9e0aac5f45c4e",
"assets/assets/images/sk.png": "e130f4f79afad3a3fa9dfb339906c994",
"assets/assets/images/sk2.png": "83d73c70db08141af97e94ed9f8970ce",
"assets/assets/images/sk3.png": "71cd5b794f927ad99e97675623aa271e",
"assets/assets/images/uiux.png": "e90ca07e487dd65d5971fa1ac7dacc70",
"assets/assets/images/whatsapp.png": "1aa80beced508dbc8357acd5c5a85b08",
"assets/assets/svg/android_studio.svg": "b7bd6eace744043bfdc726ffaaa4d94b",
"assets/assets/svg/Dart.svg": "11b770f163584b0e8cbba1f7bc626f55",
"assets/assets/svg/firbase.svg": "4a7763ad28604edd6dd9042b766d1222",
"assets/assets/svg/firebase.png": "32e2a74775eb650bcd25c08b8518118c",
"assets/assets/svg/firebase.svg": "a3dfdab3db0267979aa5f17bd2565e90",
"assets/assets/svg/flutter.png": "86bcb4bc08d1539b4d3b25fb58c9f6c5",
"assets/assets/svg/flutter.svg": "549a1b7dd82615e8e9c95c1ade8cee42",
"assets/assets/svg/github.svg": "c23a95fcb4b1d25765107e4e73b06438",
"assets/assets/svg/icon_flutter.svg": "817b4a56b047d0d36b338dd9ffd44dbd",
"assets/assets/svg/java.svg": "e8c7bcef8b6c20a7c99bbb8c4eec8f39",
"assets/assets/svg/Razorpay_logo.svg": "c671ca6ce9e00689a12e6679c01999e6",
"assets/assets/svg/rest_api.svg": "e82ea9c4960d7e9dc5c7f8fbaba4b053",
"assets/assets/svg/rozarpay.svg": "e464f75a9ffa77c1e864def2bfc1578f",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "97980c742878b05fc54231066e819228",
"assets/NOTICES": "f4f3eb449f1758f649c6e5c7597f8699",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "fd0a368c9033921763b1720805662ce5",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "936f2dbfc7819e5f08da833ba2fc426d",
"/": "936f2dbfc7819e5f08da833ba2fc426d",
"main.dart.js": "bb6887091d0f50ff3f8c9afbbd7ea4bd",
"manifest.json": "b8be490588cc263eb7106d06bc8e65fb",
"version.json": "215e97c25ce6d1839c0120d67dde9d72"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
