'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "009c9e65172e010890f7f65fde438006",
"favicon.ico": "e7a35c0e4cdb6c86861b844b5a9f2cd7",
"index.html": "41b8488e449a9f325622a8d8c6a929a6",
"/": "41b8488e449a9f325622a8d8c6a929a6",
"main.dart.js": "059e5fde2eb6503634998c10281a0f29",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"icons/Icon-192.png": "c0f9799bec69155b9cfb5c6051c9d45e",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "7db2ab7e6f238bebb9bc95cd5e6b99db",
"manifest.json": "063b4038b81c81eeafdafdb823322028",
"assets/AssetManifest.json": "de89d1a23f8514927cbbeb34704c0878",
"assets/NOTICES": "7d90810b88b9dfd0470e12c5b4d5ca42",
"assets/FontManifest.json": "1b1e7812d9eb9f666db8444d7dde1b20",
"assets/packages/material_design_icons_flutter/lib/fonts/materialdesignicons-webfont.ttf": "d10ac4ee5ebe8c8fff90505150ba2a76",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e8ab8d9fdda6cd483074249566bebff7",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "38ed4ac1f0d16e17e8cafef3d8398d64",
"assets/fonts/MaterialIcons-Regular.otf": "dea3ff6154c8a305dcc71446a8c20ef5",
"assets/assets/images/nag.png": "374232c22e77ac84ac3e66759a6b8ba6",
"assets/assets/images/img_cod.png": "51fdc63181bb84c9e002f6d423229c74",
"assets/assets/images/opusapp.png": "cb20bfd75ac254fc70c3e875dea5d8e3",
"assets/assets/images/logo_bg_chalk.png": "c1a334185fb843877c0bbf26765d9ce8",
"assets/assets/images/img_debit_credit.png": "526f23853d862ad72917e49e509afed4",
"assets/assets/images/profilepic.png": "62747b22aba12617a22cf1ff601ee5db",
"assets/assets/images/logo_bg_white.png": "dc93ef69b61ca6c67ed86cce79011a94",
"assets/assets/images/4x/profilepic4x.png": "ae9a9746273261b4271c74e04d641968",
"assets/assets/images/iot.jpg": "c7a9a2033ab505d3ec75861ecddd24e9",
"assets/assets/images/mobile_app_dev.jpg": "469c9e7475972056e03f5ed8fabcf4fe",
"assets/assets/images/img_fpx.png": "b8c0e5651490a76731d96358abe5b8cb",
"assets/assets/images/logo_no_bg.png": "d8fdbc551e3f80ab02a0814790956748",
"assets/assets/images/img_profile.png": "d4a0618693fb22a2a6d7b4d141583bae",
"assets/assets/images/bg.jpg": "0af1ea1f973185d63ec418f4642d48bd",
"assets/assets/icon/ic_google_btn.png": "56283328525663e4e2876a59b333d0d2",
"assets/assets/icon/ic_docx.png": "1292da011d32a25a62d6968e268c31cd",
"assets/assets/icon/ic_tick.png": "92507d76e619ef95bdd2b00351d52357",
"assets/assets/icon/ic_fb_btn.png": "602a93912ac927254f4103f8751b0e99",
"assets/assets/icon/4x/ic_linkedin.png": "774c60472ee6b1515a3c1fff695fbed1",
"assets/assets/icon/4x/ic_whatsapp.png": "a766581846b33fa154fcc70b0cd061f4",
"assets/assets/icon/4x/ic_twitter.png": "3f6238a31f9ab863d3a70807c149d733",
"assets/assets/icon/4x/ic_instagram.png": "19f90536f780baa733aa7ef2cddf15da",
"assets/assets/icon/4x/ic_github.png": "8996ed7c57c5533523986bdb47dfaaf5",
"assets/assets/icon/4x/ic_app_store_4x.png": "3dbead7d1a3a0674de30f79425c90c2b",
"assets/assets/icon/4x/ic_google_play_4x.png": "1d81a932671a6cec4e37c92dc08725e5",
"assets/assets/icon/4x/ic_email.png": "0113f25cc77b35ecafae58248f434adc",
"assets/assets/icon/ic_pdf.png": "a97222894fbe377e54205c55295102e4",
"assets/assets/icon/ic_ppt.png": "e276bfe366214bb7d7bb919f305a4e5f",
"assets/assets/icon/ic_xlsx.png": "133fdb544602c490e806967dddde635c",
"assets/assets/icon/ic_verified.png": "319a5a6d943ce987b6dc2e672806c662",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
"canvaskit/chromium/canvaskit.wasm": "393ec8fb05d94036734f8104fa550a67",
"canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
"canvaskit/canvaskit.wasm": "d9f69e0f428f695dc3d66b3a83a4aa8e",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15"};
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
