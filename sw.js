const CACHE = "gg-cache-hero-20260131_144654";
const ASSETS = [
  "./",
  "./index.html",
  "./usluge.html",
  "./projekti.html",
  "./odrzavanje.html",
  "./kontakt.html",
  "./img/after.jpg",
  "./img/before.jpg",
  "./img/ekipa.jpg",
  "./img/odrzavanje.jpg",
  "./img/keramika.jpg",
  "./img/adaptacija.jpg",
  "./assets/style.css",
  "./assets/app.js",
  "./manifest.webmanifest",
  "./img/logo.svg",
  "./img/logo-mark.svg",
  "./img/g1-interijer.svg",
  "./img/g2-keramika.svg",
  "./img/g3-odrzavanje.svg",
  "./img/g4-ekipa.svg"
];

self.addEventListener("install", (e) => {
  e.waitUntil(caches.open(CACHE).then(c => c.addAll(ASSETS)));
  self.skipWaiting();
});

self.addEventListener("activate", (e) => {
  e.waitUntil(
    caches.keys().then(keys => Promise.all(keys.map(k => (k !== CACHE) ? caches.delete(k) : null)))
  );
  self.clients.claim();
});

self.addEventListener("fetch", (e) => {
  e.respondWith(
    caches.match(e.request).then(res => res || fetch(e.request).then(net => {
      const copy = net.clone();
      caches.open(CACHE).then(c => c.put(e.request, copy)).catch(()=>{});
      return net;
    }).catch(()=>res))
  );
});
