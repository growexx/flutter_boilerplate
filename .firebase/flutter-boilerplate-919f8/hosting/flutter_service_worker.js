'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "404ac7ee9da5da8572940346f863bd6d",
"index.html": "b724e6065b3749aa0cf9689381027ae7",
"/": "b724e6065b3749aa0cf9689381027ae7",
"main.dart.js": "8633b0619bcb3f20ed89eb3eafc75ea8",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "3b98d9fdafacc370ef49e6a5eac196ba",
"assets/AssetManifest.json": "cf3596691dd857bdd15772f1d988cba4",
"assets/NOTICES": "556ff170799de178ebe9b6669f925c03",
"assets/FontManifest.json": "c8cecbdca35401ce44857ea48047bd03",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/packages/easy_localization/i18n/ar-DZ.json": "acc0a8eebb2fcee312764600f7cc41ec",
"assets/packages/easy_localization/i18n/en.json": "5f5fda8715e8bf5116f77f469c5cf493",
"assets/packages/easy_localization/i18n/en-US.json": "5f5fda8715e8bf5116f77f469c5cf493",
"assets/packages/easy_localization/i18n/ar.json": "acc0a8eebb2fcee312764600f7cc41ec",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "3bb221e9b36000bff01b547b8620222c",
"assets/fonts/MaterialIcons-Regular.otf": "a338b32c8b689c056178694deae7c24d",
"assets/assets/png/error.png": "798c6e95c75c11b6b5379062d1761a42",
"assets/assets/font/montserrat/Montserrat-VariableFont_wght.ttf": "0862772643ff65b7a76ef8cde6c26eae",
"assets/assets/font/montserrat/Montserrat-Italic-VariableFont_wght.ttf": "7d5651a0a4c34cfd26cbeeff4662eeb1",
"assets/assets/font/montserrat/Montserrat-LightItalic.ttf": "109c02a67fc3a8511275cb415d2ce2d9",
"assets/assets/font/montserrat/Montserrat-Medium.ttf": "128c3c68ca7303b88442a347292291fa",
"assets/assets/font/montserrat/Montserrat-BoldItalic.ttf": "c645b4313b3c505b700c292cbdbf3bd8",
"assets/assets/font/montserrat/Montserrat-Light.ttf": "bcf14e7123e6a0a873151c78e5c316c6",
"assets/assets/font/montserrat/Montserrat-ThinItalic.ttf": "ff07fc8d013894ad1e432552a67f6c19",
"assets/assets/font/montserrat/Montserrat-ExtraLight.ttf": "324a0e0cec3a73b38b58703bc5747b17",
"assets/assets/font/montserrat/Montserrat-Thin.ttf": "250b795c8fe6f7add514bc8af2050b8f",
"assets/assets/font/montserrat/Montserrat-Bold.ttf": "c4bd22ebfc4d76f100ebefd2cf916227",
"assets/assets/font/montserrat/Montserrat-MediumItalic.ttf": "fafaedc048b0a95d5aacef9b650a9489",
"assets/assets/font/montserrat/Montserrat-BlackItalic.ttf": "f1d0b5e6b13a3d9bb8cbd9efb8f45043",
"assets/assets/font/montserrat/Montserrat-SemiBold.ttf": "cbdecee7a45d92a998429b0290bf02b0",
"assets/assets/font/montserrat/Montserrat-ExtraLightItalic.ttf": "b99427f9d8344dbf4befb450f452386c",
"assets/assets/font/montserrat/Montserrat-ExtraBold.ttf": "bf087000dc560f8f2a318d4ddad4720f",
"assets/assets/font/montserrat/Montserrat-Black.ttf": "976649f5b0b109bfc06c008372d90094",
"assets/assets/font/montserrat/Montserrat-Regular.ttf": "430be0dd245faf1cc788fac6680c2d71",
"assets/assets/font/montserrat/Montserrat-Italic.ttf": "2e79685963d89831a0878b5fe44ce9b5",
"assets/assets/font/montserrat/Montserrat-SemiBoldItalic.ttf": "7599de565fd20b987468026d7724bba3",
"assets/assets/font/montserrat/Montserrat-ExtraBoldItalic.ttf": "026abe49088e8b1a63ab037e3ef13c23",
"assets/assets/translations/en-US.json": "8831fcb334cadc2144831beab28e2370",
"assets/assets/translations/hi-IN.json": "ba56a0c6548f5c1b2884571f734882a4",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
