/* Gradec Gradnja – site script */
(function(){
  const $ = (q, root=document) => root.querySelector(q);
  const $$ = (q, root=document) => Array.from(root.querySelectorAll(q));

  // year
  const y = $("#year");
  if (y) y.textContent = new Date().getFullYear();

  // mobile menu
  const menuBtn = $("#menuBtn");
  const panel = $("#mobilePanel");
  if (menuBtn && panel){
    menuBtn.addEventListener("click", () => {
      const isOpen = panel.classList.toggle("open");
      menuBtn.setAttribute("aria-expanded", isOpen ? "true" : "false");
    });
    $$("a", panel).forEach(a => a.addEventListener("click", () => panel.classList.remove("open")));
  }

  // smooth scroll for in-page anchors
  $$('a[href^="#"]').forEach(a => {
    a.addEventListener("click", (e) => {
      const id = a.getAttribute("href");
      if (!id || id === "#") return;
      const el = document.querySelector(id);
      if (el){
        e.preventDefault();
        el.scrollIntoView({behavior:"smooth", block:"start"});
      }
    });
  });

  // reveal on scroll
  const revealEls = $$(".reveal");
  if ("IntersectionObserver" in window && revealEls.length){
    const io = new IntersectionObserver((entries) => {
      entries.forEach(en => { if (en.isIntersecting) en.target.classList.add("in"); });
    }, {threshold: 0.12});
    revealEls.forEach(el => io.observe(el));
  } else {
    revealEls.forEach(el => el.classList.add("in"));
  }

  // FAQ accordion
  $$(".faq-item").forEach(item => {
    const q = $(".faq-q", item);
    const a = $(".faq-a", item);
    if (!q || !a) return;
    q.addEventListener("click", () => {
      const open = item.classList.toggle("open");
      a.style.maxHeight = open ? (a.scrollHeight + 20) + "px" : "0px";
    });
  });

  // Simple slider (testimonials)
  const slider = $("#slider");
  if (slider){
    const slides = $("#slides", slider);
    const prev = $("#prevSlide", slider);
    const next = $("#nextSlide", slider);
    let idx = 0;
    const count = slides ? slides.children.length : 0;

    const go = (n) => {
      if (!slides || count === 0) return;
      idx = (n + count) % count;
      slides.style.transform = `translateX(-${idx * 100}%)`;
    };
    prev?.addEventListener("click", () => go(idx - 1));
    next?.addEventListener("click", () => go(idx + 1));
    // auto-advance gentle
    setInterval(() => go(idx + 1), 6500);
  }

  // Modal gallery
  const modal = $("#modal");
  if (modal){
    const frame = $("#modalFrame");
    const title = $("#modalTitle");
    const close = $("#modalClose");
    const openers = $$("[data-modal-src]");
    const open = (src, t) => {
      if (frame) frame.src = src;
      if (title) title.textContent = t || "Pregled";
      modal.classList.add("open");
      modal.setAttribute("aria-hidden", "false");
    };
    const shut = () => {
      modal.classList.remove("open");
      modal.setAttribute("aria-hidden", "true");
      if (frame) frame.src = "";
    };
    openers.forEach(btn => {
      btn.addEventListener("click", () => open(btn.getAttribute("data-modal-src"), btn.getAttribute("data-modal-title")));
    });
    close?.addEventListener("click", shut);
    modal.addEventListener("click", (e) => { if (e.target === modal) shut(); });
    document.addEventListener("keydown", (e)=>{ if (e.key === "Escape") shut(); });
  }

  // Theme toggle
  const themeBtn = $("#themeBtn");
  const root = document.documentElement;

  function setTheme(t){
    root.setAttribute("data-theme", t);
    localStorage.setItem("gg_theme", t);
    if (themeBtn) themeBtn.textContent = (t === "light") ? "🌙 Tamno" : "☀️ Svijetlo";
  }

  const saved = localStorage.getItem("gg_theme");
  if (saved){
    setTheme(saved);
  } else {
    // default: respect system
    const prefersLight = window.matchMedia && window.matchMedia("(prefers-color-scheme: light)").matches;
    setTheme(prefersLight ? "light" : "dark");
  }

  themeBtn?.addEventListener("click", () => {
    const cur = root.getAttribute("data-theme") || "dark";
    setTheme(cur === "dark" ? "light" : "dark");
  });

  // Contact form -> mailto (no backend)
  const form = $("#inquiryForm");
  if (form){
    form.addEventListener("submit", (e) => {
      e.preventDefault();
      const v = (id) => (document.getElementById(id)?.value || "").trim();
      const name = v("name");
      const phone = v("phone");
      const service = v("service");
      const location = v("location");
      const message = v("message");

      const to = "info@ggupravljanje.com"; // PROMIJENI ovdje ako treba
      const subject = encodeURIComponent(`Upit – ${service} (Gradec Gradnja)`);
      const body = encodeURIComponent(
        `Ime: ${name}\nTelefon: ${phone}\nUsluga: ${service}\nLokacija: ${location}\n\nOpis:\n${message}\n`
      );
      window.location.href = `mailto:${to}?subject=${subject}&body=${body}`;
    });
  }

  // PWA install hint (optional)
  window.addEventListener("load", () => {
    if ("serviceWorker" in navigator){
      navigator.serviceWorker.register("./sw.js").catch(()=>{});
    }
  });
})();

/* GG_HERO_ROTATOR_JS */
(function () {
  function ready(fn){ if(document.readyState!=="loading") fn(); else document.addEventListener("DOMContentLoaded", fn); }

  ready(function(){
    var img = document.getElementById("heroRotatorImg");
    var wrap = document.getElementById("heroRotator");
    var list = window.__GG_HERO_IMAGES || [];
    if(!img || !wrap || !Array.isArray(list) || list.length < 2) return;

    var i = 0;
    img.src = list[0];

    setInterval(function(){
      i = (i + 1) % list.length;
      img.classList.add("fade");
      setTimeout(function(){
        img.src = list[i];
        img.classList.remove("fade");
      }, 450);
    }, 4500);
  });
})();

/* GG_STICKY_BAR_JS */
(function(){
  function ready(fn){ if(document.readyState!=="loading") fn(); else document.addEventListener("DOMContentLoaded", fn); }
  ready(function(){
    // sticky bar
    if(document.querySelector(".sticky-bar")) return;
    var cfg = (window.GG_CONFIG || {});
    var phoneTel = cfg.PHONE_TEL || "+385957982203";
    var phoneDisp = cfg.PHONE_DISPLAY || "095 798 2203";
    var wa = cfg.WHATSAPP_NUMBER || "385957982203";

    var bar = document.createElement("div");
    bar.className = "sticky-bar";
    bar.innerHTML = `
      <a class="primary" href="tel:${phoneTel}">📞 ${phoneDisp}</a>
      <a target="_blank" rel="noopener" href="https://wa.me/${wa}?text=Pozdrav!%20Saljem%20fotke%20%2B%20lokaciju%20%2B%20kvadraturu.%20Trebam%20ponudu.">💬 WhatsApp</a>
      <a href="./kontakt.html">🧾 Ponuda</a>
    `;
    document.body.appendChild(bar);

    // FAQ toggle (ako postoji .faq-item)
    document.querySelectorAll(".faq-item").forEach(function(item){
      var q = item.querySelector(".faq-q");
      var a = item.querySelector(".faq-a");
      if(!q || !a) return;
      a.style.display = "none";
      q.addEventListener("click", function(){
        a.style.display = (a.style.display==="none") ? "block" : "none";
      });
    });
  });
})();

/* GG_KALKULATOR_JS */
(function(){
  function ready(fn){ if(document.readyState!=="loading") fn(); else document.addEventListener("DOMContentLoaded", fn); }
  ready(function(){
    var form = document.getElementById("ggCalc");
    if(!form) return;

    var out = document.getElementById("ggCalcOut");
    var service = document.getElementById("ggCalcService");
    var sqm = document.getElementById("ggCalcSqm");

    function calc(){
      var s = (service && service.value) || "adaptacija";
      var m2 = parseFloat((sqm && sqm.value) || "0");
      if(!m2 || m2 <= 0){ out.textContent = "Upiši kvadraturu za procjenu."; return; }

      // okvirne cijene po m2 (neobvezujuće)
      var rates = {
        "keramika": [25, 45],
        "krecenje": [4, 9],
        "gletanje": [6, 14],
        "suhomontaza": [20, 40],
        "adaptacija": [180, 420],
        "odrzavanje": [0, 0]
      };

      if(s === "odrzavanje"){
        out.textContent = "Održavanje zgrada ide po dogovoru (mjesečni paket / intervencije). Pošalji opis + fotke za točnu ponudu.";
        return;
      }

      var r = rates[s] || rates["adaptacija"];
      var lo = Math.round(m2 * r[0]);
      var hi = Math.round(m2 * r[1]);
      out.textContent = "Okvirna procjena: " + lo + "€ – " + hi + "€ (neobvezujuće). Za točnu ponudu pošalji fotke + lokaciju + kvadraturu.";
    }

    form.addEventListener("input", calc);
    calc();
  });
})();

/* GG_GDPR_TRACKING */
(function(){
  function $(q,root){ return (root||document).querySelector(q); }
  function $all(q,root){ return Array.from((root||document).querySelectorAll(q)); }

  // simple localStorage consent
  var CONSENT_KEY="gg_consent_v1";
  function getConsent(){
    try{ return JSON.parse(localStorage.getItem(CONSENT_KEY)||"null"); }catch(e){ return null; }
  }
  function setConsent(obj){
    localStorage.setItem(CONSENT_KEY, JSON.stringify(obj));
  }
  function hasAnalyticsConsent(){
    var c=getConsent();
    return c && c.analytics===true;
  }

  // Inject GA4 + Pixel only if consented
  function loadGA4(id){
    if(!id) return;
    var s=document.createElement("script");
    s.async=true;
    s.src="https://www.googletagmanager.com/gtag/js?id="+encodeURIComponent(id);
    document.head.appendChild(s);

    window.dataLayer=window.dataLayer||[];
    function gtag(){ dataLayer.push(arguments); }
    window.gtag=gtag;
    gtag("js", new Date());
    gtag("config", id, { anonymize_ip: true });
  }

  function loadPixel(pid){
    if(!pid) return;
    !(function(f,b,e,v,n,t,s){
      if(f.fbq)return; n=f.fbq=function(){n.callMethod?
      n.callMethod.apply(n,arguments):n.queue.push(arguments)};
      if(!f._fbq)f._fbq=n; n.push=n; n.loaded=!0; n.version='2.0';
      n.queue=[]; t=b.createElement(e); t.async=!0;
      t.src=v; s=b.getElementsByTagName(e)[0];
      s.parentNode.insertBefore(t,s)
    })(window, document,'script','https://connect.facebook.net/en_US/fbevents.js');
    fbq('init', pid);
    fbq('track', 'PageView');
  }

  // Track events
  function track(name, params){
    params=params||{};
    if(window.gtag) window.gtag("event", name, params);
    if(window.fbq) window.fbq("trackCustom", name, params);
    // also store minimal local stats
    try{
      var k="gg_stats_v1";
      var s=JSON.parse(localStorage.getItem(k)||"{}");
      s[name]=(s[name]||0)+1;
      localStorage.setItem(k, JSON.stringify(s));
    }catch(e){}
  }

  // Cookie banner UI
  function renderBanner(){
    if(getConsent()) return;
    var b=document.createElement("div");
    b.id="ggCookie";
    b.style.cssText="position:fixed;left:12px;right:12px;bottom:12px;z-index:9999;max-width:980px;margin:0 auto;background:rgba(15,23,42,.92);border:1px solid rgba(148,163,184,.25);backdrop-filter:blur(10px);padding:14px 14px;border-radius:16px;box-shadow:0 12px 40px rgba(0,0,0,.35);";
    b.innerHTML =
      '<div style="display:flex;gap:12px;align-items:flex-start;flex-wrap:wrap;justify-content:space-between">' +
        '<div style="min-width:240px;flex:1">' +
          '<div style="font-weight:800;margin-bottom:4px">🍪 Privatnost</div>' +
          '<div style="opacity:.9;line-height:1.4">Koristimo kolačiće za osnovnu funkcionalnost i (opcionalno) analitiku kako bismo poboljšali web i povećali upite.</div>' +
        '</div>' +
        '<div style="display:flex;gap:10px;flex-wrap:wrap">' +
          '<button id="ggDecline" class="btn" type="button">Samo nužno</button>' +
          '<button id="ggAccept" class="btn primary" type="button">Prihvati analitiku</button>' +
        '</div>' +
      '</div>';
    document.body.appendChild(b);

    $("#ggDecline",b).onclick=function(){
      setConsent({necessary:true, analytics:false, ts:Date.now()});
      b.remove();
    };
    $("#ggAccept",b).onclick=function(){
      setConsent({necessary:true, analytics:true, ts:Date.now()});
      b.remove();
      // load scripts after consent
      var cfg=window.GG_CONFIG||{};
      loadGA4(cfg.GA4_ID||"");
      loadPixel(cfg.META_PIXEL_ID||"");
    };
  }

  function init(){
    var cfg=window.GG_CONFIG||{};
    var c=getConsent();
    if(c && c.analytics===true){
      loadGA4(cfg.GA4_ID||"");
      loadPixel(cfg.META_PIXEL_ID||"");
    } else {
      renderBanner();
    }

    // track clicks on tel: and wa.me
    document.addEventListener("click", function(e){
      var a=e.target.closest && e.target.closest("a");
      if(!a) return;
      var href=(a.getAttribute("href")||"").trim();
      if(href.startsWith("tel:")) track("click_call",{href:href});
      if(href.includes("wa.me/")) track("click_whatsapp",{href:href});
      if(href.includes("kontakt.html")) track("click_offer",{href:href});
    }, true);

    // track form submits
    $all("form").forEach(function(f){
      f.addEventListener("submit", function(){
        track("submit_form",{id:f.id||"form"});
      }, true);
    });

    // mini admin stats page hook (if exists)
    var admin=$("#ggAdminStats");
    if(admin){
      try{
        var s=JSON.parse(localStorage.getItem("gg_stats_v1")||"{}");
        admin.textContent=JSON.stringify(s,null,2);
        var btn=$("#ggExportCSV");
        if(btn){
          btn.onclick=function(){
            var rows=[["event","count"]];
            Object.keys(s).sort().forEach(function(k){ rows.push([k,String(s[k])]); });
            var csv=rows.map(r=>r.map(x=>('"'+x.replace(/"/g,'""')+'"')).join(",")).join("\n");
            var blob=new Blob([csv],{type:"text/csv"});
            var url=URL.createObjectURL(blob);
            var a=document.createElement("a");
            a.href=url; a.download="gg-stats.csv";
            document.body.appendChild(a); a.click(); a.remove();
            URL.revokeObjectURL(url);
          };
        }
      }catch(e){}
    }
  }

  if(document.readyState!=="loading") init();
  else document.addEventListener("DOMContentLoaded", init);
})();

/* GG_GALLERY_LIGHTBOX */
(function(){
  function qs(sel){ return document.querySelector(sel); }
  function qsa(sel){ return Array.from(document.querySelectorAll(sel)); }

  const box = qs('#ggLightbox');
  const img = qs('#ggLightboxImg');
  const closeBtn = qs('#ggLightboxClose');

  function close(){
    if(!box) return;
    box.style.display = 'none';
    if(img) img.src = '';
  }
  function open(src){
    if(!box || !img) return;
    img.src = src;
    box.style.display = 'block';
  }

  document.addEventListener('click', function(e){
    const a = e.target.closest && e.target.closest('a.gg-gal-item');
    if(a){
      e.preventDefault();
      open(a.getAttribute('href'));
    }
    if(e.target && (e.target.id === 'ggLightbox' || e.target.id === 'ggLightboxClose')){
      close();
    }
  });

  document.addEventListener('keydown', function(e){
    if(e.key === 'Escape') close();
  });
})();
