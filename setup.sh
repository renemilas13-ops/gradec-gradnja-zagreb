#!/data/data/com.termux/files/usr/bin/bash
set -e

mkdir -p assets img

# -------------------------
# assets/style.css
# -------------------------
cat > assets/style.css <<'CSS'
:root{
  --bg:#070b14;
  --bg2:#0b1220;
  --card: rgba(255,255,255,.06);
  --card2: rgba(255,255,255,.09);
  --stroke: rgba(255,255,255,.12);
  --text: rgba(255,255,255,.92);
  --muted: rgba(255,255,255,.72);
  --muted2: rgba(255,255,255,.56);
  --accent:#7c3aed;   /* violet */
  --accent2:#22c55e;  /* green */
  --accent3:#38bdf8;  /* sky */
  --warn:#f59e0b;
  --shadow: 0 18px 60px rgba(0,0,0,.45);
  --shadow2: 0 10px 28px rgba(0,0,0,.38);
  --radius: 18px;
  --radius2: 26px;
  --max: 1160px;
  --font: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Helvetica, Arial, "Apple Color Emoji", "Segoe UI Emoji";
  --grad: linear-gradient(135deg, rgba(124,58,237,.85), rgba(56,189,248,.55));
  --gradSoft: linear-gradient(135deg, rgba(124,58,237,.22), rgba(56,189,248,.12), rgba(34,197,94,.12));
}

/* Light theme overrides */
[data-theme="light"]{
  --bg:#f6f7fb;
  --bg2:#ffffff;
  --card: rgba(0,0,0,.04);
  --card2: rgba(0,0,0,.06);
  --stroke: rgba(0,0,0,.10);
  --text: rgba(12,16,26,.92);
  --muted: rgba(12,16,26,.72);
  --muted2: rgba(12,16,26,.56);
  --shadow: 0 18px 60px rgba(18,24,40,.12);
  --shadow2: 0 10px 28px rgba(18,24,40,.12);
}

*{box-sizing:border-box}
html,body{height:100%}
body{
  margin:0;
  font-family:var(--font);
  color:var(--text);
  background:
    radial-gradient(1200px 700px at 15% 10%, rgba(124,58,237,.20), transparent 55%),
    radial-gradient(900px 600px at 90% 15%, rgba(56,189,248,.14), transparent 55%),
    radial-gradient(1200px 900px at 70% 95%, rgba(34,197,94,.12), transparent 55%),
    linear-gradient(180deg, var(--bg), var(--bg2));
  overflow-x:hidden;
}
a{color:inherit; text-decoration:none}
img{max-width:100%; height:auto; display:block}
.container{max-width:var(--max); margin:0 auto; padding:0 18px}

.blur-orb{
  position:absolute; width:520px; height:520px; border-radius:999px;
  filter: blur(70px); opacity:.22; pointer-events:none;
  background: radial-gradient(circle at 30% 30%, rgba(124,58,237,.9), transparent 60%),
              radial-gradient(circle at 70% 60%, rgba(56,189,248,.7), transparent 62%),
              radial-gradient(circle at 30% 80%, rgba(34,197,94,.7), transparent 64%);
  transform: translate3d(0,0,0);
}
.orb1{top:-180px; left:-160px}
.orb2{top:-220px; right:-220px; opacity:.18}
.orb3{bottom:-260px; left:10%; opacity:.16}

header{
  position:sticky; top:0; z-index:50;
  background: color-mix(in oklab, var(--bg) 60%, transparent);
  backdrop-filter: blur(14px);
  border-bottom: 1px solid color-mix(in oklab, var(--stroke) 65%, transparent);
}
.nav{
  display:flex; align-items:center; justify-content:space-between;
  padding:12px 0;
  gap:12px;
}
.brand{
  display:flex; align-items:center; gap:12px;
  min-width: 250px;
}
.logo{
  width:44px; height:44px; border-radius:14px;
  background: linear-gradient(135deg, rgba(124,58,237,.25), rgba(56,189,248,.18));
  border: 1px solid var(--stroke);
  box-shadow: var(--shadow2);
  display:grid; place-items:center;
}
.brand-title{line-height:1.1}
.brand-title b{display:block; font-size:14px; letter-spacing:.35px}
.brand-title span{display:block; font-size:12px; color: var(--muted2)}
nav ul{
  list-style:none; display:flex; align-items:center; gap:10px;
  padding:0; margin:0;
}
nav a{
  font-size:13px; color: var(--muted);
  padding:9px 12px; border-radius:999px;
  border: 1px solid transparent;
  transition: .2s ease;
}
nav a:hover{
  color:var(--text);
  border-color: color-mix(in oklab, var(--stroke) 90%, transparent);
  background: color-mix(in oklab, var(--card) 85%, transparent);
}

.nav-cta{display:flex; align-items:center; gap:10px}
.btn{
  border:1px solid color-mix(in oklab, var(--stroke) 95%, transparent);
  background: color-mix(in oklab, var(--card) 90%, transparent);
  color: var(--text);
  padding:10px 14px;
  border-radius:999px;
  font-size:13px;
  display:inline-flex; align-items:center; gap:9px;
  transition:.2s ease;
  cursor:pointer;
  user-select:none;
  white-space:nowrap;
}
.btn:hover{
  transform: translateY(-1px);
  background: color-mix(in oklab, var(--card2) 92%, transparent);
  box-shadow: var(--shadow2);
}
.btn.primary{
  border-color: color-mix(in oklab, var(--accent) 55%, transparent);
  background: var(--grad);
  box-shadow: 0 18px 55px color-mix(in oklab, var(--accent) 22%, transparent);
}
.btn.ghost{background:transparent}
.icon{width:16px; height:16px; display:inline-block}
.menu-btn{display:none}

.panel{
  display:none;
  border-top:1px solid color-mix(in oklab, var(--stroke) 70%, transparent);
  padding: 10px 0 14px;
}
.panel.open{display:block}
.panel a{
  display:block;
  padding:10px 12px;
  border-radius: 14px;
  border: 1px solid color-mix(in oklab, var(--stroke) 70%, transparent);
  background: color-mix(in oklab, var(--card) 85%, transparent);
  color: var(--muted);
  margin-top:8px;
}
.panel a:hover{
  color:var(--text);
  border-color: color-mix(in oklab, var(--stroke) 95%, transparent);
  background: color-mix(in oklab, var(--card2) 90%, transparent);
}

/* Page header / hero */
.hero{
  position:relative;
  padding: 42px 0 18px;
}
.hero-grid{
  display:grid;
  grid-template-columns: 1.1fr .9fr;
  gap: 18px;
  align-items:stretch;
  margin-top: 16px;
}
.hero-card{
  border: 1px solid color-mix(in oklab, var(--stroke) 85%, transparent);
  background: linear-gradient(180deg,
    color-mix(in oklab, var(--card2) 70%, transparent),
    color-mix(in oklab, var(--card) 70%, transparent)
  );
  border-radius: var(--radius2);
  box-shadow: var(--shadow);
  overflow:hidden;
  position:relative;
}
.hero-left{padding: 26px}
.kicker{
  display:inline-flex; align-items:center; gap:10px;
  border:1px solid color-mix(in oklab, var(--stroke) 75%, transparent);
  background: color-mix(in oklab, var(--card) 80%, transparent);
  padding:8px 12px;
  border-radius:999px;
  font-size:12px;
  color: var(--muted);
}
.dot{
  width:8px; height:8px; border-radius:99px;
  background: radial-gradient(circle at 30% 30%, #fff, rgba(255,255,255,.25));
  box-shadow: 0 0 0 4px rgba(124,58,237,.18), 0 0 16px rgba(124,58,237,.35);
}
h1{
  margin: 16px 0 10px;
  font-size: clamp(28px, 3.6vw, 46px);
  letter-spacing:-.7px;
  line-height:1.05;
}
.lead{
  margin:0;
  color: var(--muted);
  font-size: 15px;
  line-height:1.65;
  max-width: 64ch;
}
.hero-actions{
  display:flex; flex-wrap:wrap; gap:10px;
  margin-top:16px; align-items:center;
}
.pill-row{
  display:flex; flex-wrap:wrap; gap:10px; margin-top:16px;
}
.pill{
  font-size:12px; color: var(--muted);
  border:1px solid color-mix(in oklab, var(--stroke) 70%, transparent);
  background: color-mix(in oklab, var(--card) 85%, transparent);
  padding:8px 10px; border-radius:999px;
  display:flex; align-items:center; gap:8px;
}
.pill b{color:var(--text); font-weight:650}

.hero-right{display:flex; flex-direction:column}
.hero-media{padding: 16px; display:flex; flex-direction:column; gap:12px; height:100%}

.mini{
  border:1px solid color-mix(in oklab, var(--stroke) 70%, transparent);
  background: color-mix(in oklab, var(--card) 85%, transparent);
  border-radius: var(--radius);
  padding: 14px;
  display:flex; gap:12px;
  align-items:center;
}
.mini h3{margin:0; font-size:13px; letter-spacing:.2px}
.mini p{margin:4px 0 0; font-size:12px; color:var(--muted2); line-height:1.45}
.badge{
  width:44px; height:44px; border-radius:16px;
  border:1px solid color-mix(in oklab, var(--stroke) 75%, transparent);
  background: var(--gradSoft);
  display:grid; place-items:center;
  flex: 0 0 auto;
}

/* Sections */
section{padding: 26px 0}
.section-head{
  display:flex; align-items:flex-end; justify-content:space-between;
  gap:14px; margin: 10px 0 14px;
}
.section-head h2{
  margin:0; font-size: 20px; letter-spacing:-.2px;
}
.section-head p{
  margin:0; max-width: 70ch;
  color: var(--muted); font-size: 13px; line-height:1.6;
}

.grid{display:grid; gap:12px}
.grid.cols3{grid-template-columns: repeat(3, minmax(0,1fr))}
.grid.cols2{grid-template-columns: repeat(2, minmax(0,1fr))}
.card{
  border: 1px solid color-mix(in oklab, var(--stroke) 70%, transparent);
  background: color-mix(in oklab, var(--card) 85%, transparent);
  border-radius: var(--radius);
  box-shadow: var(--shadow2);
  overflow:hidden;
  position:relative;
}
.card.pad{padding: 16px}
.card h3{margin:0 0 6px; font-size:14px}
.card p{margin:0; color: var(--muted); font-size:13px; line-height:1.6}
.meta{display:flex; gap:8px; flex-wrap:wrap; margin-top:10px}
.tag{
  font-size:11px; color: var(--muted);
  padding:6px 9px;
  border-radius:999px;
  border:1px solid color-mix(in oklab, var(--stroke) 70%, transparent);
  background: color-mix(in oklab, var(--card) 85%, transparent);
}

.media{
  border-bottom: 1px solid color-mix(in oklab, var(--stroke) 70%, transparent);
  background: linear-gradient(180deg, color-mix(in oklab, var(--card) 80%, transparent), transparent);
  padding: 10px;
  display:grid; place-items:center;
}
.project{display:flex; flex-direction:column; height:100%}
.project .body{padding:14px}
.project .body h3{margin:0 0 6px}
.project .body p{margin:0}

/* CTA strip */
.cta{
  border: 1px solid color-mix(in oklab, var(--stroke) 80%, transparent);
  background: var(--gradSoft);
  border-radius: var(--radius2);
  box-shadow: var(--shadow);
  padding: 18px;
  display:flex;
  align-items:center;
  justify-content:space-between;
  gap:14px;
  overflow:hidden;
  position:relative;
}
.cta h3{margin:0; font-size:16px}
.cta p{margin:6px 0 0; font-size:13px; color: var(--muted); line-height:1.55}
.cta .left{max-width: 74ch}

/* Testimonials */
.slider{
  position:relative;
  overflow:hidden;
}
.slides{
  display:flex;
  transition: transform .35s ease;
  will-change: transform;
}
.slide{
  min-width: 100%;
  padding:16px;
}
.quote{
  display:flex; flex-direction:column; gap:10px;
}
.quote p{margin:0; color:var(--muted); font-size:13px; line-height:1.7}
.quote .who{display:flex; align-items:center; justify-content:space-between; gap:10px; margin-top:6px}
.stars{letter-spacing:1px; opacity:.9}

.slider-controls{
  display:flex; gap:10px; margin-top:10px; justify-content:flex-end;
}

/* FAQ accordion */
.faq{display:flex; flex-direction:column; gap:10px}
.faq-item{
  border:1px solid color-mix(in oklab, var(--stroke) 70%, transparent);
  background: color-mix(in oklab, var(--card) 85%, transparent);
  border-radius: 16px;
  overflow:hidden;
}
.faq-q{
  display:flex; justify-content:space-between; gap:10px;
  padding: 14px 14px;
  cursor:pointer;
  user-select:none;
}
.faq-q b{font-size:13px}
.faq-a{
  max-height: 0;
  overflow:hidden;
  transition: max-height .28s ease;
  padding: 0 14px;
}
.faq-a p{margin:0 0 14px; color:var(--muted); font-size:13px; line-height:1.65}

/* Gallery modal */
.modal{
  position:fixed; inset:0;
  display:none;
  background: rgba(0,0,0,.55);
  backdrop-filter: blur(10px);
  z-index:1000;
  padding: 16px;
}
.modal.open{display:grid; place-items:center}
.modal-card{
  width:min(980px, 100%);
  border:1px solid rgba(255,255,255,.12);
  background: color-mix(in oklab, var(--bg2) 86%, transparent);
  border-radius: 22px;
  box-shadow: var(--shadow);
  overflow:hidden;
}
.modal-top{
  display:flex; justify-content:space-between; align-items:center; gap:10px;
  padding: 10px 12px;
  border-bottom:1px solid color-mix(in oklab, var(--stroke) 70%, transparent);
}
.modal-top b{font-size:13px}
.modal-body{padding: 10px}
.modal-close{border-radius:999px}

/* Forms */
form{
  display:grid;
  grid-template-columns: 1fr 1fr;
  gap:12px;
}
.field{display:flex; flex-direction:column; gap:7px}
label{font-size:12px; color: var(--muted)}
input, textarea{
  width:100%;
  padding: 12px 12px;
  border-radius: 14px;
  border: 1px solid color-mix(in oklab, var(--stroke) 75%, transparent);
  background: color-mix(in oklab, var(--card) 90%, transparent);
  color: var(--text);
  outline:none;
  transition:.2s ease;
  font-family: var(--font);
  font-size:13px;
}
textarea{grid-column: 1 / -1; min-height: 130px; resize:vertical}
input:focus, textarea:focus{
  border-color: color-mix(in oklab, var(--accent3) 60%, transparent);
  box-shadow: 0 0 0 4px color-mix(in oklab, var(--accent3) 14%, transparent);
}
.form-actions{
  grid-column: 1 / -1;
  display:flex; gap:10px; flex-wrap:wrap; align-items:center
}
.hint{font-size:12px; color: var(--muted2); line-height:1.5}

/* Footer */
footer{padding: 18px 0 30px; color: var(--muted2); font-size:12px}
.footer-grid{
  display:flex; justify-content:space-between; gap:12px; flex-wrap:wrap;
  border-top:1px solid color-mix(in oklab, var(--stroke) 60%, transparent);
  padding-top:14px;
}

/* Reveal */
.reveal{opacity:0; transform: translateY(10px); transition: .55s ease}
.reveal.in{opacity:1; transform:none}

@media (max-width: 980px){
  .hero-grid{grid-template-columns: 1fr}
}
@media (max-width: 760px){
  nav ul{display:none}
  .menu-btn{display:inline-flex}
  .grid.cols3{grid-template-columns: 1fr}
  .grid.cols2{grid-template-columns: 1fr}
  form{grid-template-columns: 1fr}
  .brand{min-width:auto}
}
CSS

# -------------------------
# assets/app.js
# -------------------------
cat > assets/app.js <<'JS'
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
JS

# -------------------------
# img/logo.svg (GG + zgrade)
# -------------------------
cat > img/logo.svg <<'SVG'
<svg width="220" height="64" viewBox="0 0 220 64" fill="none" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Gradec Gradnja logo">
  <defs>
    <linearGradient id="gg" x1="0" y1="0" x2="64" y2="64" gradientUnits="userSpaceOnUse">
      <stop stop-color="#A78BFA"/>
      <stop offset="0.55" stop-color="#38BDF8"/>
      <stop offset="1" stop-color="#22C55E"/>
    </linearGradient>
  </defs>

  <rect x="2" y="2" width="60" height="60" rx="18" fill="url(#gg)" opacity="0.18"/>
  <rect x="2" y="2" width="60" height="60" rx="18" stroke="rgba(255,255,255,.25)" stroke-width="2"/>

  <!-- buildings icon -->
  <path d="M16 52V26c0-1.2.7-2.2 1.8-2.6l10-4c1.8-.7 3.6.6 3.6 2.6V52" stroke="url(#gg)" stroke-width="2.6" stroke-linecap="round"/>
  <path d="M38 52V18.5c0-1.5 1.2-2.7 2.7-2.7h8.6c1.5 0 2.7 1.2 2.7 2.7V52" stroke="url(#gg)" stroke-width="2.6" stroke-linecap="round"/>
  <path d="M12 52h44" stroke="rgba(255,255,255,.25)" stroke-width="2" stroke-linecap="round"/>

  <!-- windows -->
  <path d="M21 30h5M21 36h5M21 42h5" stroke="rgba(255,255,255,.70)" stroke-width="2" stroke-linecap="round"/>
  <path d="M43 24h5M43 30h5M43 36h5M43 42h5" stroke="rgba(255,255,255,.70)" stroke-width="2" stroke-linecap="round"/>

  <!-- Wordmark -->
  <text x="76" y="30" font-family="ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Helvetica, Arial" font-size="18" fill="rgba(255,255,255,.92)" font-weight="700">Gradec Gradnja</text>
  <text x="76" y="50" font-family="ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Helvetica, Arial" font-size="12" fill="rgba(255,255,255,.62)">Unutarnji radovi • Keramika • Održavanje zgrada</text>
</svg>
SVG

# -------------------------
# img/logo-mark.svg (samo mark)
# -------------------------
cat > img/logo-mark.svg <<'SVG'
<svg width="96" height="96" viewBox="0 0 96 96" fill="none" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="GG mark">
  <defs>
    <linearGradient id="m" x1="0" y1="0" x2="96" y2="96">
      <stop stop-color="#A78BFA"/>
      <stop offset="0.55" stop-color="#38BDF8"/>
      <stop offset="1" stop-color="#22C55E"/>
    </linearGradient>
  </defs>
  <rect x="6" y="6" width="84" height="84" rx="26" fill="url(#m)" opacity=".18"/>
  <rect x="6" y="6" width="84" height="84" rx="26" stroke="rgba(255,255,255,.22)" stroke-width="2"/>
  <path d="M24 76V40c0-1.6 1-3.1 2.6-3.7l14-5.6c2.4-1 4.8.8 4.8 3.7V76" stroke="url(#m)" stroke-width="3.2" stroke-linecap="round"/>
  <path d="M56 76V30c0-1.8 1.5-3.3 3.3-3.3h12.4c1.8 0 3.3 1.5 3.3 3.3v46" stroke="url(#m)" stroke-width="3.2" stroke-linecap="round"/>
  <path d="M18 76h60" stroke="rgba(255,255,255,.25)" stroke-width="2.6" stroke-linecap="round"/>
  <path d="M29 46h7M29 54h7M29 62h7" stroke="rgba(255,255,255,.65)" stroke-width="2.8" stroke-linecap="round"/>
  <path d="M62 38h8M62 46h8M62 54h8M62 62h8" stroke="rgba(255,255,255,.65)" stroke-width="2.8" stroke-linecap="round"/>
</svg>
SVG

# -------------------------
# img/gallery SVGs (fiktivne "realne" scene)
# -------------------------
cat > img/g1-interijer.svg <<'SVG'
<svg width="1200" height="700" viewBox="0 0 1200 700" fill="none" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Fiktivni interijer">
  <defs>
    <linearGradient id="bg" x1="0" y1="0" x2="1" y2="1">
      <stop stop-color="rgba(124,58,237,.32)"/>
      <stop offset="0.55" stop-color="rgba(56,189,248,.20)"/>
      <stop offset="1" stop-color="rgba(34,197,94,.16)"/>
    </linearGradient>
    <linearGradient id="wall" x1="0" y1="0" x2="0" y2="1">
      <stop stop-color="rgba(255,255,255,.10)"/>
      <stop offset="1" stop-color="rgba(255,255,255,.04)"/>
    </linearGradient>
    <linearGradient id="floor" x1="0" y1="1" x2="1" y2="0">
      <stop stop-color="rgba(255,255,255,.08)"/>
      <stop offset="1" stop-color="rgba(255,255,255,.02)"/>
    </linearGradient>
    <filter id="n" x="-20%" y="-20%" width="140%" height="140%">
      <feTurbulence type="fractalNoise" baseFrequency="0.9" numOctaves="2" stitchTiles="stitch" />
      <feColorMatrix type="saturate" values="0"/>
      <feComponentTransfer><feFuncA type="table" tableValues="0 0.14"/></feComponentTransfer>
    </filter>
  </defs>

  <rect width="1200" height="700" rx="34" fill="url(#bg)"/>
  <rect x="70" y="80" width="760" height="360" rx="26" fill="url(#wall)" stroke="rgba(255,255,255,.16)" stroke-width="2"/>
  <rect x="70" y="440" width="1060" height="170" rx="30" fill="url(#floor)" stroke="rgba(255,255,255,.14)" stroke-width="2"/>

  <!-- window -->
  <rect x="110" y="120" width="320" height="220" rx="20" fill="rgba(255,255,255,.07)" stroke="rgba(255,255,255,.16)" stroke-width="2"/>
  <path d="M270 120v220M110 230h320" stroke="rgba(255,255,255,.18)" stroke-width="2"/>
  <circle cx="245" cy="250" r="60" fill="rgba(56,189,248,.10)"/>
  <circle cx="320" cy="205" r="36" fill="rgba(34,197,94,.10)"/>

  <!-- sofa -->
  <rect x="520" y="290" width="450" height="150" rx="28" fill="rgba(255,255,255,.08)" stroke="rgba(255,255,255,.14)" stroke-width="2"/>
  <rect x="550" y="320" width="180" height="90" rx="22" fill="rgba(255,255,255,.06)"/>
  <rect x="750" y="320" width="190" height="90" rx="22" fill="rgba(255,255,255,.06)"/>

  <!-- table -->
  <rect x="720" y="470" width="220" height="90" rx="24" fill="rgba(255,255,255,.07)" stroke="rgba(255,255,255,.12)" stroke-width="2"/>
  <path d="M745 560v35M915 560v35" stroke="rgba(255,255,255,.18)" stroke-width="6" stroke-linecap="round"/>

  <!-- “photo grain” -->
  <rect width="1200" height="700" filter="url(#n)" opacity=".35"/>
</svg>
SVG

cat > img/g2-keramika.svg <<'SVG'
<svg width="1200" height="700" viewBox="0 0 1200 700" fill="none" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Fiktivna kupaonica - keramika">
  <defs>
    <linearGradient id="bg2" x1="0" y1="0" x2="1" y2="1">
      <stop stop-color="rgba(34,197,94,.18)"/>
      <stop offset="0.5" stop-color="rgba(56,189,248,.20)"/>
      <stop offset="1" stop-color="rgba(124,58,237,.18)"/>
    </linearGradient>
    <filter id="n2" x="-20%" y="-20%" width="140%" height="140%">
      <feTurbulence type="fractalNoise" baseFrequency="0.75" numOctaves="2" stitchTiles="stitch" />
      <feColorMatrix type="saturate" values="0"/>
      <feComponentTransfer><feFuncA type="table" tableValues="0 0.12"/></feComponentTransfer>
    </filter>
  </defs>

  <rect width="1200" height="700" rx="34" fill="url(#bg2)"/>

  <!-- tiles wall -->
  <rect x="90" y="80" width="780" height="520" rx="28" fill="rgba(255,255,255,.06)" stroke="rgba(255,255,255,.14)" stroke-width="2"/>
  <g stroke="rgba(255,255,255,.18)" stroke-width="2">
    <path d="M90 160H870"/><path d="M90 240H870"/><path d="M90 320H870"/><path d="M90 400H870"/><path d="M90 480H870"/><path d="M90 560H870"/>
    <path d="M190 80V600"/><path d="M290 80V600"/><path d="M390 80V600"/><path d="M490 80V600"/><path d="M590 80V600"/><path d="M690 80V600"/><path d="M790 80V600"/>
  </g>

  <!-- shower -->
  <rect x="920" y="120" width="200" height="420" rx="26" fill="rgba(255,255,255,.06)" stroke="rgba(255,255,255,.14)" stroke-width="2"/>
  <circle cx="1020" cy="175" r="44" fill="rgba(255,255,255,.06)" stroke="rgba(255,255,255,.18)" stroke-width="2"/>
  <path d="M1000 175h40M1020 155v40" stroke="rgba(255,255,255,.35)" stroke-width="4" stroke-linecap="round"/>

  <!-- floor -->
  <rect x="90" y="610" width="1030" height="60" rx="22" fill="rgba(255,255,255,.05)" stroke="rgba(255,255,255,.12)" stroke-width="2"/>

  <rect width="1200" height="700" filter="url(#n2)" opacity=".35"/>
</svg>
SVG

cat > img/g3-odrzavanje.svg <<'SVG'
<svg width="1200" height="700" viewBox="0 0 1200 700" fill="none" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Fiktivno održavanje zgrade">
  <defs>
    <linearGradient id="bg3" x1="0" y1="0" x2="1" y2="1">
      <stop stop-color="rgba(56,189,248,.22)"/>
      <stop offset="0.6" stop-color="rgba(124,58,237,.20)"/>
      <stop offset="1" stop-color="rgba(34,197,94,.16)"/>
    </linearGradient>
    <filter id="n3" x="-20%" y="-20%" width="140%" height="140%">
      <feTurbulence type="fractalNoise" baseFrequency="0.8" numOctaves="2" stitchTiles="stitch" />
      <feColorMatrix type="saturate" values="0"/>
      <feComponentTransfer><feFuncA type="table" tableValues="0 0.13"/></feComponentTransfer>
    </filter>
  </defs>

  <rect width="1200" height="700" rx="34" fill="url(#bg3)"/>
  <rect x="120" y="110" width="350" height="480" rx="28" fill="rgba(255,255,255,.07)" stroke="rgba(255,255,255,.14)" stroke-width="2"/>
  <rect x="500" y="80" width="520" height="510" rx="28" fill="rgba(255,255,255,.06)" stroke="rgba(255,255,255,.14)" stroke-width="2"/>

  <!-- windows -->
  <g stroke="rgba(255,255,255,.18)" stroke-width="2" stroke-linecap="round">
    <path d="M160 170h90M160 220h90M160 270h90M160 320h90M160 370h90M160 420h90M160 470h90"/>
    <path d="M540 150h130M540 200h130M540 250h130M540 300h130M540 350h130M540 400h130M540 450h130"/>
    <path d="M720 150h260M720 200h260M720 250h260M720 300h260M720 350h260M720 400h260M720 450h260"/>
  </g>

  <!-- tools icon -->
  <circle cx="1050" cy="160" r="64" fill="rgba(255,255,255,.06)" stroke="rgba(255,255,255,.14)" stroke-width="2"/>
  <path d="M1022 165l28-28 18 18-28 28-18-18Z" fill="rgba(255,255,255,.12)" stroke="rgba(255,255,255,.18)" stroke-width="2"/>
  <path d="M1042 142l-18-18" stroke="rgba(255,255,255,.28)" stroke-width="3" stroke-linecap="round"/>
  <path d="M1084 202l-30-30" stroke="rgba(255,255,255,.28)" stroke-width="3" stroke-linecap="round"/>

  <path d="M90 600h1020" stroke="rgba(255,255,255,.18)" stroke-width="6" stroke-linecap="round"/>
  <rect width="1200" height="700" filter="url(#n3)" opacity=".35"/>
</svg>
SVG

cat > img/g4-ekipa.svg <<'SVG'
<svg width="1200" height="700" viewBox="0 0 1200 700" fill="none" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Fiktivna ekipa na gradilištu">
  <defs>
    <linearGradient id="bg4" x1="0" y1="0" x2="1" y2="1">
      <stop stop-color="rgba(245,158,11,.14)"/>
      <stop offset="0.5" stop-color="rgba(56,189,248,.18)"/>
      <stop offset="1" stop-color="rgba(124,58,237,.18)"/>
    </linearGradient>
    <filter id="n4" x="-20%" y="-20%" width="140%" height="140%">
      <feTurbulence type="fractalNoise" baseFrequency="0.9" numOctaves="2" stitchTiles="stitch" />
      <feColorMatrix type="saturate" values="0"/>
      <feComponentTransfer><feFuncA type="table" tableValues="0 0.12"/></feComponentTransfer>
    </filter>
  </defs>

  <rect width="1200" height="700" rx="34" fill="url(#bg4)"/>
  <rect x="120" y="130" width="960" height="420" rx="30" fill="rgba(255,255,255,.06)" stroke="rgba(255,255,255,.14)" stroke-width="2"/>

  <!-- silhouettes -->
  <g opacity=".9">
    <circle cx="390" cy="280" r="54" fill="rgba(255,255,255,.08)"/>
    <rect x="330" y="330" width="120" height="170" rx="34" fill="rgba(255,255,255,.07)"/>
    <circle cx="610" cy="270" r="52" fill="rgba(255,255,255,.07)"/>
    <rect x="550" y="320" width="120" height="180" rx="34" fill="rgba(255,255,255,.06)"/>
    <circle cx="830" cy="285" r="50" fill="rgba(255,255,255,.06)"/>
    <rect x="770" y="335" width="120" height="165" rx="34" fill="rgba(255,255,255,.06)"/>
  </g>

  <!-- tools + lines -->
  <path d="M260 520h680" stroke="rgba(255,255,255,.18)" stroke-width="6" stroke-linecap="round"/>
  <rect width="1200" height="700" filter="url(#n4)" opacity=".35"/>
</svg>
SVG

# -------------------------
# manifest + sw (PWA)
# -------------------------
cat > manifest.webmanifest <<'MAN'
{
  "name": "Gradec Gradnja",
  "short_name": "Gradec",
  "start_url": "./index.html",
  "display": "standalone",
  "background_color": "#0b1220",
  "theme_color": "#0b1220",
  "icons": [
    { "src": "./img/logo-mark.svg", "sizes": "96x96", "type": "image/svg+xml" }
  ]
}
MAN

cat > sw.js <<'SW'
const CACHE = "gg-cache-v1";
const ASSETS = [
  "./",
  "./index.html",
  "./usluge.html",
  "./projekti.html",
  "./odrzavanje.html",
  "./kontakt.html",
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
SW

# -------------------------
# Shared head snippet function (write directly in HTML files here)
# -------------------------

# CONTACT INFO
PHONE_DISPLAY="095 798 2203"
PHONE_TEL="+385957982203"
EMAIL="info@ggupravljanje.com"   # <-- promijeni ako treba (ti si naveo "ggupravljanje.com" bez @)

# -------------------------
# index.html
# -------------------------
cat > index.html <<HTML
<!doctype html>
<html lang="hr">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Gradec Gradnja | Unutarnji radovi, keramika i održavanje zgrada | Zagreb</title>
  <meta name="description" content="Gradec Gradnja – unutarnji radovi, keramika, adaptacije i održavanje zgrada u Zagrebu. Brzo, uredno i profesionalno. Nazovi ${PHONE_DISPLAY}." />
  <meta name="theme-color" content="#0b1220" />
  <link rel="manifest" href="./manifest.webmanifest" />
  <link rel="stylesheet" href="./assets/style.css" />
  <link rel="icon" href="./img/logo-mark.svg" type="image/svg+xml" />
  <script type="application/ld+json">
  {
    "@context":"https://schema.org",
    "@type":"LocalBusiness",
    "name":"Gradec Gradnja",
    "description":"Unutarnji radovi, keramika, adaptacije i održavanje zgrada u Zagrebu.",
    "areaServed":"Zagreb",
    "telephone":"${PHONE_TEL}",
    "email":"${EMAIL}"
  }
  </script>
</head>

<body>
  <div class="blur-orb orb1"></div>
  <div class="blur-orb orb2"></div>
  <div class="blur-orb orb3"></div>

  <header>
    <div class="container">
      <div class="nav">
        <a class="brand" href="./index.html" aria-label="Početna">
          <div class="logo" aria-hidden="true">
            <img src="./img/logo-mark.svg" alt="" width="28" height="28"/>
          </div>
          <div class="brand-title">
            <b>Gradec Gradnja</b>
            <span>Unutarnji radovi • Keramika • Održavanje zgrada</span>
          </div>
        </a>

        <nav aria-label="Glavni izbornik">
          <ul>
            <li><a href="./usluge.html">Usluge</a></li>
            <li><a href="./projekti.html">Projekti</a></li>
            <li><a href="./odrzavanje.html">Održavanje</a></li>
            <li><a href="./kontakt.html">Kontakt</a></li>
          </ul>
        </nav>

        <div class="nav-cta">
          <button class="btn ghost" id="themeBtn" type="button" title="Promijeni temu">☀️ Svijetlo</button>
          <a class="btn" href="tel:${PHONE_TEL}" title="Nazovi odmah"><span class="icon">📞</span> ${PHONE_DISPLAY}</a>
          <button class="btn primary menu-btn" id="menuBtn" aria-expanded="false" aria-controls="mobilePanel" type="button">
            <span class="icon">☰</span> Izbornik
          </button>
          <a class="btn primary" href="./kontakt.html" title="Zatraži ponudu"><span class="icon">🧾</span> Zatraži ponudu</a>
        </div>
      </div>

      <div class="panel" id="mobilePanel" aria-label="Mobilni izbornik">
        <a href="./usluge.html">Usluge</a>
        <a href="./projekti.html">Projekti</a>
        <a href="./odrzavanje.html">Održavanje</a>
        <a href="./kontakt.html">Kontakt</a>
      </div>
    </div>
  </header>

  <main>
    <div class="container hero">
      <div class="hero-grid">
        <div class="hero-card hero-left reveal">
          <div class="kicker"><span class="dot"></span> Zagreb i okolica • Precizno • Uredno • Rokovi po dogovoru</div>
          <h1>Premium završna obrada interijera + pouzdano održavanje zgrada.</h1>
          <p class="lead">
            Radimo adaptacije, keramiku i unutarnje radove — plus održavanje zgrada kroz redovne i hitne intervencije.
            Cilj: <b>kvaliteta koja se vidi</b> i izvođenje koje te ne opterećuje.
          </p>

          <div class="hero-actions">
            <a class="btn primary" href="tel:${PHONE_TEL}"><span class="icon">⚡</span> Nazovi odmah</a>
            <a class="btn" href="./projekti.html"><span class="icon">🏗️</span> Galerija radova</a>
            <a class="btn" href="./usluge.html"><span class="icon">🧰</span> Sve usluge</a>
          </div>

          <div class="pill-row">
            <div class="pill"><span>✅</span> <b>Jasna ponuda</b> (opseg + troškovnik)</div>
            <div class="pill"><span>🧼</span> <b>Čisto</b> & uredno gradilište</div>
            <div class="pill"><span>🧱</span> <b>Detalji</b> “na milimetar”</div>
          </div>

          <div style="margin-top:18px">
            <div class="cta">
              <div class="left">
                <h3>Hoćeš ponudu brzo?</h3>
                <p>Pošalji dimenzije + 2–3 fotke stanja (ako imaš). Dobiješ jasan plan i okvirnu cijenu.</p>
              </div>
              <div>
                <a class="btn primary" href="./kontakt.html"><span class="icon">✉️</span> Pošalji upit</a>
              </div>
            </div>
          </div>
        </div>

        <div class="hero-card hero-right reveal">
          <div class="hero-media">
            <div class="mini">
              <div class="badge" aria-hidden="true">🏢</div>
              <div>
                <h3>Održavanje zgrada</h3>
                <p>Sanacije, popravci, zajednički prostori, hitne intervencije i redovni obilazak.</p>
              </div>
            </div>
            <div class="mini">
              <div class="badge" aria-hidden="true">🛁</div>
              <div>
                <h3>Keramika</h3>
                <p>Hidroizolacija, ravnine, fuge, rezovi i čisti rubovi — “kao iz kataloga”.</p>
              </div>
            </div>
            <div class="mini">
              <div class="badge" aria-hidden="true">🧰</div>
              <div>
                <h3>Unutarnji radovi</h3>
                <p>Adaptacije, suha gradnja, gletanje, bojanje, završni radovi i popravci.</p>
              </div>
            </div>

            <div class="card" style="overflow:hidden">
              <div class="media">
                <img src="./img/g1-interijer.svg" alt="Fiktivni prikaz adaptacije interijera" />
              </div>
              <div class="card pad">
                <h3>“Vizualno realno” – ali fiktivno</h3>
                <p>Galerija su SVG scene (brzo se učitava, izgleda kao “foto” stil). Kad imaš prave fotke, samo ih zamijeni.</p>
                <div class="meta">
                  <span class="tag">Brzo</span>
                  <span class="tag">Bez vanjskih linkova</span>
                  <span class="tag">Spremno za zamjenu</span>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>

    <section>
      <div class="container">
        <div class="section-head">
          <div>
            <h2>Najtraženije</h2>
            <p>Tri paketa koje najčešće radimo u praksi.</p>
          </div>
        </div>

        <div class="grid cols3">
          <div class="card pad reveal">
            <h3>Adaptacija stana</h3>
            <p>Organizacija, zaštita prostora, završna obrada, detalji i primopredaja — bez “vuci/poteži”.</p>
            <div class="meta">
              <span class="tag">Plan + izvedba</span><span class="tag">Rokovi</span><span class="tag">Urednost</span>
            </div>
          </div>
          <div class="card pad reveal">
            <h3>Kupaonica (keramika)</h3>
            <p>Hidroizolacija, ravnine, fuge i precizni rezovi. Kvaliteta koja drži godinama.</p>
            <div class="meta">
              <span class="tag">Hidroizolacija</span><span class="tag">Fuge</span><span class="tag">Detalji</span>
            </div>
          </div>
          <div class="card pad reveal">
            <h3>Održavanje zgrada</h3>
            <p>Redovne intervencije, popravci, sitne sanacije i koordinacija radova za predstavnike suvlasnika.</p>
            <div class="meta">
              <span class="tag">Redovno</span><span class="tag">Hitno po potrebi</span><span class="tag">Pouzdano</span>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section>
      <div class="container">
        <div class="section-head">
          <div>
            <h2>Zašto Gradec Gradnja</h2>
            <p>Stvar koja najviše znači klijentima: komunikacija + urednost + završni detalj.</p>
          </div>
        </div>

        <div class="grid cols2">
          <div class="card pad reveal">
            <h3>Standard izvođenja</h3>
            <p>Ne preskačemo pripremu. Dobra podloga i precizan završetak = rezultat koji traje.</p>
            <div class="meta"><span class="tag">Priprema</span><span class="tag">Kontrola</span></div>
          </div>
          <div class="card pad reveal">
            <h3>Urednost i zaštita prostora</h3>
            <p>Zaštita podova i namještaja, čišćenje kroz radove, pristojna primopredaja.</p>
            <div class="meta"><span class="tag">Čisto</span><span class="tag">Bez nereda</span></div>
          </div>
          <div class="card pad reveal">
            <h3>Brza organizacija</h3>
            <p>Dogovor, plan i jasan slijed radova — da znaš gdje si u svakom trenutku.</p>
            <div class="meta"><span class="tag">Plan</span><span class="tag">Rok</span></div>
          </div>
          <div class="card pad reveal">
            <h3>Održavanje zgrada</h3>
            <p>Jedna kontakt točka za više tipova intervencija — idealno za zgrade i upravitelje.</p>
            <div class="meta"><span class="tag">Intervencije</span><span class="tag">Koordinacija</span></div>
          </div>
        </div>

        <div style="margin-top:12px" class="cta reveal">
          <div class="left">
            <h3>Javi se odmah — ili pošalji upit</h3>
            <p>Najbrže rješavamo kad dobijemo kratak opis + okvirnu kvadraturu.</p>
          </div>
          <div style="display:flex; gap:10px; flex-wrap:wrap; justify-content:flex-end">
            <a class="btn" href="tel:${PHONE_TEL}"><span class="icon">📞</span> ${PHONE_DISPLAY}</a>
            <a class="btn primary" href="./kontakt.html"><span class="icon">✉️</span> Kontakt</a>
          </div>
        </div>
      </div>
    </section>

    <section>
      <div class="container">
        <div class="section-head">
          <div>
            <h2>Ocjene (primjeri)</h2>
            <p>Fiktivne ocjene samo kao “look & feel” za web. Kasnije zamijeni pravima.</p>
          </div>
        </div>

        <div class="card slider reveal" id="slider">
          <div class="slides" id="slides">
            <div class="slide">
              <div class="quote">
                <p>“Kupaonica odrađena vrhunski — ravnine, fuge i detalji. Najviše mi se svidjelo što je sve bilo uredno.”</p>
                <div class="who">
                  <span><b>Marija K.</b> • Trešnjevka</span>
                  <span class="stars">★★★★★</span>
                </div>
              </div>
            </div>
            <div class="slide">
              <div class="quote">
                <p>“Dogovorili smo rok i sve je ispoštovano. Komunikacija čista, bez iznenađenja u trošku.”</p>
                <div class="who">
                  <span><b>Ivan P.</b> • Maksimir</span>
                  <span class="stars">★★★★★</span>
                </div>
              </div>
            </div>
            <div class="slide">
              <div class="quote">
                <p>“Za zgradu su super — sitni popravci i sanacije rješeni brzo. Imaš osjećaj da netko stvarno drži stvari pod kontrolom.”</p>
                <div class="who">
                  <span><b>Predstavnik suvlasnika</b></span>
                  <span class="stars">★★★★★</span>
                </div>
              </div>
            </div>
          </div>

          <div class="slider-controls" style="padding: 0 16px 16px">
            <button class="btn" type="button" id="prevSlide">⬅️</button>
            <button class="btn" type="button" id="nextSlide">➡️</button>
          </div>
        </div>
      </div>
    </section>

    <section>
      <div class="container">
        <div class="section-head">
          <div>
            <h2>FAQ</h2>
            <p>Kratko, konkretno — bez filozofije.</p>
          </div>
        </div>

        <div class="faq reveal">
          <div class="faq-item">
            <div class="faq-q"><b>Radite li manje popravke?</b><span>➕</span></div>
            <div class="faq-a"><p>Da — posebno kroz održavanje zgrada (sitne sanacije, popravci, intervencije po dogovoru).</p></div>
          </div>
          <div class="faq-item">
            <div class="faq-q"><b>Može li adaptacija “ključ u ruke”?</b><span>➕</span></div>
            <div class="faq-a"><p>Može. Najbitnije nam je jasan opseg, plan i komunikacija — tako se izbjegnu iznenađenja.</p></div>
          </div>
          <div class="faq-item">
            <div class="faq-q"><b>Kako do okvirne cijene?</b><span>➕</span></div>
            <div class="faq-a"><p>Pošalji dimenzije + opis. Ako treba, dogovorimo izlazak i preciziramo opseg radova.</p></div>
          </div>
        </div>
      </div>
    </section>

  </main>

  <footer>
    <div class="container footer-grid">
      <div>
        <img src="./img/logo.svg" alt="Gradec Gradnja" style="max-width:360px; width:100%; height:auto; opacity:.95"/>
        <div style="margin-top:8px">Unutarnji radovi • Keramika • Održavanje zgrada</div>
      </div>
      <div>
        📞 <a href="tel:${PHONE_TEL}">${PHONE_DISPLAY}</a><br/>
        ✉️ <a href="mailto:${EMAIL}">${EMAIL}</a>
      </div>
      <div>
        © <span id="year"></span> Gradec Gradnja. Sva prava pridržana.
      </div>
    </div>
  </footer>

  <div class="modal" id="modal" aria-hidden="true">
    <div class="modal-card">
      <div class="modal-top">
        <b id="modalTitle">Pregled</b>
        <button class="btn modal-close" id="modalClose" type="button">✕</button>
      </div>
      <div class="modal-body">
        <iframe id="modalFrame" title="Galerija" style="width:100%; height:560px; border:0; border-radius:16px; background:transparent"></iframe>
      </div>
    </div>
  </div>

  <script src="./assets/app.js"></script>
</body>
</html>
HTML

# -------------------------
# usluge.html
# -------------------------
cat > usluge.html <<HTML
<!doctype html>
<html lang="hr">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Usluge | Gradec Gradnja</title>
  <meta name="description" content="Usluge Gradec Gradnje: unutarnji radovi, keramika, adaptacije i održavanje zgrada." />
  <meta name="theme-color" content="#0b1220" />
  <link rel="manifest" href="./manifest.webmanifest" />
  <link rel="stylesheet" href="./assets/style.css" />
  <link rel="icon" href="./img/logo-mark.svg" type="image/svg+xml" />
</head>
<body>
  <div class="blur-orb orb1"></div>
  <div class="blur-orb orb2"></div>

  <header>
    <div class="container">
      <div class="nav">
        <a class="brand" href="./index.html" aria-label="Početna">
          <div class="logo"><img src="./img/logo-mark.svg" alt="" width="28" height="28"/></div>
          <div class="brand-title"><b>Gradec Gradnja</b><span>Usluge</span></div>
        </a>
        <nav><ul>
          <li><a href="./usluge.html">Usluge</a></li>
          <li><a href="./projekti.html">Projekti</a></li>
          <li><a href="./odrzavanje.html">Održavanje</a></li>
          <li><a href="./kontakt.html">Kontakt</a></li>
        </ul></nav>
        <div class="nav-cta">
          <button class="btn ghost" id="themeBtn" type="button">☀️ Svijetlo</button>
          <a class="btn" href="tel:${PHONE_TEL}">📞 ${PHONE_DISPLAY}</a>
          <button class="btn primary menu-btn" id="menuBtn" aria-expanded="false" aria-controls="mobilePanel" type="button">☰ Izbornik</button>
        </div>
      </div>
      <div class="panel" id="mobilePanel">
        <a href="./usluge.html">Usluge</a>
        <a href="./projekti.html">Projekti</a>
        <a href="./odrzavanje.html">Održavanje</a>
        <a href="./kontakt.html">Kontakt</a>
      </div>
    </div>
  </header>

  <main>
    <div class="container hero">
      <div class="hero-card hero-left reveal" style="padding: 22px">
        <div class="kicker"><span class="dot"></span> Sve na jednom mjestu</div>
        <h1>Usluge koje radimo svaki dan.</h1>
        <p class="lead">Unutarnji radovi i keramika + održavanje zgrada. Fokus na pripremu, urednost i detalje.</p>
        <div class="hero-actions">
          <a class="btn primary" href="./kontakt.html">✉️ Zatraži ponudu</a>
          <a class="btn" href="tel:${PHONE_TEL}">📞 Nazovi</a>
        </div>
      </div>
    </div>

    <section>
      <div class="container">
        <div class="grid cols3">
          <div class="card pad reveal">
            <h3>Unutarnji radovi</h3>
            <p>Adaptacije, suha gradnja, gletanje, bojanje, završni radovi, sitni popravci.</p>
            <div class="meta"><span class="tag">Adaptacije</span><span class="tag">Završna obrada</span></div>
          </div>
          <div class="card pad reveal">
            <h3>Keramika</h3>
            <p>Priprema, hidroizolacija, pločice, fugiranje, rezovi, rubni profili.</p>
            <div class="meta"><span class="tag">Hidroizolacija</span><span class="tag">Precizne fuge</span></div>
          </div>
          <div class="card pad reveal">
            <h3>Održavanje zgrada</h3>
            <p>Sanacije, popravci, zajednički prostori, hitne intervencije i redovni obilazak.</p>
            <div class="meta"><span class="tag">Redovno</span><span class="tag">Intervencije</span></div>
          </div>
        </div>

        <div style="margin-top:12px" class="grid cols2">
          <div class="card pad reveal">
            <h3>Što dobiješ</h3>
            <p>Jasan dogovor, realan rok, uredno izvođenje, primopredaju bez natezanja.</p>
            <div class="meta"><span class="tag">Dogovor</span><span class="tag">Rok</span><span class="tag">Urednost</span></div>
          </div>
          <div class="card pad reveal">
            <h3>Kako procjenjujemo</h3>
            <p>Opis + dimenzije. Po potrebi izlazak na lokaciju za preciznu ponudu.</p>
            <div class="meta"><span class="tag">Brzo</span><span class="tag">Transparentno</span></div>
          </div>
        </div>

        <div style="margin-top:12px" class="cta reveal">
          <div class="left">
            <h3>Trebaš ponudu?</h3>
            <p>Pošalji kratak opis i okvirnu kvadraturu — dobit ćeš jasan prijedlog.</p>
          </div>
          <div style="display:flex; gap:10px; flex-wrap:wrap; justify-content:flex-end">
            <a class="btn" href="tel:${PHONE_TEL}">📞 ${PHONE_DISPLAY}</a>
            <a class="btn primary" href="./kontakt.html">✉️ Kontakt</a>
          </div>
        </div>
      </div>
    </section>
  </main>

  <footer>
    <div class="container footer-grid">
      <div>© <span id="year"></span> Gradec Gradnja</div>
      <div>📞 <a href="tel:${PHONE_TEL}">${PHONE_DISPLAY}</a> • ✉️ <a href="mailto:${EMAIL}">${EMAIL}</a></div>
    </div>
  </footer>

  <script src="./assets/app.js"></script>
</body>
</html>
HTML

# -------------------------
# projekti.html (galerija + modal)
# -------------------------
cat > projekti.html <<HTML
<!doctype html>
<html lang="hr">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Projekti | Gradec Gradnja</title>
  <meta name="description" content="Galerija radova: adaptacije, keramika, održavanje zgrada (fiktivni prikazi za demo)."/>
  <meta name="theme-color" content="#0b1220" />
  <link rel="manifest" href="./manifest.webmanifest" />
  <link rel="stylesheet" href="./assets/style.css" />
  <link rel="icon" href="./img/logo-mark.svg" type="image/svg+xml" />
</head>
<body>
  <div class="blur-orb orb1"></div>
  <div class="blur-orb orb2"></div>

  <header>
    <div class="container">
      <div class="nav">
        <a class="brand" href="./index.html">
          <div class="logo"><img src="./img/logo-mark.svg" alt="" width="28" height="28"/></div>
          <div class="brand-title"><b>Gradec Gradnja</b><span>Projekti</span></div>
        </a>
        <nav><ul>
          <li><a href="./usluge.html">Usluge</a></li>
          <li><a href="./projekti.html">Projekti</a></li>
          <li><a href="./odrzavanje.html">Održavanje</a></li>
          <li><a href="./kontakt.html">Kontakt</a></li>
        </ul></nav>
        <div class="nav-cta">
          <button class="btn ghost" id="themeBtn" type="button">☀️ Svijetlo</button>
          <a class="btn" href="tel:${PHONE_TEL}">📞 ${PHONE_DISPLAY}</a>
          <button class="btn primary menu-btn" id="menuBtn" aria-expanded="false" aria-controls="mobilePanel" type="button">☰ Izbornik</button>
        </div>
      </div>
      <div class="panel" id="mobilePanel">
        <a href="./usluge.html">Usluge</a>
        <a href="./projekti.html">Projekti</a>
        <a href="./odrzavanje.html">Održavanje</a>
        <a href="./kontakt.html">Kontakt</a>
      </div>
    </div>
  </header>

  <main>
    <div class="container hero">
      <div class="hero-card hero-left reveal" style="padding:22px">
        <div class="kicker"><span class="dot"></span> Galerija (demo)</div>
        <h1>Primjeri završnog standarda.</h1>
        <p class="lead">Ovo su fiktivne “foto” scene (SVG) za demo. Kad imaš prave fotke, zamijeni datoteke u mapi <b>/img</b>.</p>
      </div>
    </div>

    <section>
      <div class="container">
        <div class="grid cols3">
          <article class="card project reveal">
            <div class="media">
              <img src="./img/g1-interijer.svg" alt="Adaptacija interijera – demo"/>
            </div>
            <div class="body">
              <h3>Adaptacija interijera</h3>
              <p>Gletanje, bojanje, završni detalji — uredno i precizno.</p>
              <div class="meta">
                <button class="btn" type="button" data-modal-src="./img/g1-interijer.svg" data-modal-title="Adaptacija interijera">🔍 Pogledaj</button>
                <span class="tag">Unutarnji radovi</span>
              </div>
            </div>
          </article>

          <article class="card project reveal">
            <div class="media">
              <img src="./img/g2-keramika.svg" alt="Keramika – demo"/>
            </div>
            <div class="body">
              <h3>Keramika / kupaonica</h3>
              <p>Hidroizolacija, ravnine, fuge, detalji.</p>
              <div class="meta">
                <button class="btn" type="button" data-modal-src="./img/g2-keramika.svg" data-modal-title="Keramika / kupaonica">🔍 Pogledaj</button>
                <span class="tag">Keramika</span>
              </div>
            </div>
          </article>

          <article class="card project reveal">
            <div class="media">
              <img src="./img/g3-odrzavanje.svg" alt="Održavanje zgrade – demo"/>
            </div>
            <div class="body">
              <h3>Održavanje zgrade</h3>
              <p>Sanacije i intervencije za zajedničke prostore.</p>
              <div class="meta">
                <button class="btn" type="button" data-modal-src="./img/g3-odrzavanje.svg" data-modal-title="Održavanje zgrade">🔍 Pogledaj</button>
                <span class="tag">Održavanje</span>
              </div>
            </div>
          </article>

          <article class="card project reveal">
            <div class="media">
              <img src="./img/g4-ekipa.svg" alt="Ekipa na gradilištu – demo"/>
            </div>
            <div class="body">
              <h3>Ekipa i organizacija</h3>
              <p>Brza organizacija i jasna komunikacija kroz radove.</p>
              <div class="meta">
                <button class="btn" type="button" data-modal-src="./img/g4-ekipa.svg" data-modal-title="Ekipa i organizacija">🔍 Pogledaj</button>
                <span class="tag">Organizacija</span>
              </div>
            </div>
          </article>

          <div class="card pad reveal">
            <h3>Kako zamijeniti demo fotke</h3>
            <p>Ubaci svoje slike u <b>/img</b> i preimenuj ih u <b>g1-interijer.jpg</b> itd. Pa u HTML promijeni .svg u .jpg.</p>
            <div class="meta"><span class="tag">Jednostavno</span><span class="tag">Brzo</span></div>
          </div>

          <div class="card pad reveal">
            <h3>Želiš “prave” AI fotke?</h3>
            <p>Mogu ti složiti set promptova za 20 fotki (interijeri, keramika, održavanje, ekipa) za bilo koji generator.</p>
            <div class="meta"><span class="tag">Prompts</span><span class="tag">Brand look</span></div>
          </div>
        </div>
      </div>
    </section>
  </main>

  <footer>
    <div class="container footer-grid">
      <div>© <span id="year"></span> Gradec Gradnja</div>
      <div>📞 <a href="tel:${PHONE_TEL}">${PHONE_DISPLAY}</a> • ✉️ <a href="mailto:${EMAIL}">${EMAIL}</a></div>
    </div>
  </footer>

  <div class="modal" id="modal" aria-hidden="true">
    <div class="modal-card">
      <div class="modal-top">
        <b id="modalTitle">Pregled</b>
        <button class="btn modal-close" id="modalClose" type="button">✕</button>
      </div>
      <div class="modal-body">
        <iframe id="modalFrame" title="Galerija" style="width:100%; height:560px; border:0; border-radius:16px; background:transparent"></iframe>
      </div>
    </div>
  </div>

  <script src="./assets/app.js"></script>
</body>
</html>
HTML

# -------------------------
# odrzavanje.html
# -------------------------
cat > odrzavanje.html <<HTML
<!doctype html>
<html lang="hr">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Održavanje zgrada | Gradec Gradnja</title>
  <meta name="description" content="Održavanje zgrada: redovni obilazak, sanacije, popravci i hitne intervencije."/>
  <meta name="theme-color" content="#0b1220" />
  <link rel="manifest" href="./manifest.webmanifest" />
  <link rel="stylesheet" href="./assets/style.css" />
  <link rel="icon" href="./img/logo-mark.svg" type="image/svg+xml" />
</head>
<body>
  <div class="blur-orb orb1"></div>
  <div class="blur-orb orb3"></div>

  <header>
    <div class="container">
      <div class="nav">
        <a class="brand" href="./index.html">
          <div class="logo"><img src="./img/logo-mark.svg" alt="" width="28" height="28"/></div>
          <div class="brand-title"><b>Gradec Gradnja</b><span>Održavanje zgrada</span></div>
        </a>
        <nav><ul>
          <li><a href="./usluge.html">Usluge</a></li>
          <li><a href="./projekti.html">Projekti</a></li>
          <li><a href="./odrzavanje.html">Održavanje</a></li>
          <li><a href="./kontakt.html">Kontakt</a></li>
        </ul></nav>
        <div class="nav-cta">
          <button class="btn ghost" id="themeBtn" type="button">☀️ Svijetlo</button>
          <a class="btn" href="tel:${PHONE_TEL}">📞 ${PHONE_DISPLAY}</a>
          <button class="btn primary menu-btn" id="menuBtn" aria-expanded="false" aria-controls="mobilePanel" type="button">☰ Izbornik</button>
        </div>
      </div>
      <div class="panel" id="mobilePanel">
        <a href="./usluge.html">Usluge</a>
        <a href="./projekti.html">Projekti</a>
        <a href="./odrzavanje.html">Održavanje</a>
        <a href="./kontakt.html">Kontakt</a>
      </div>
    </div>
  </header>

  <main>
    <div class="container hero">
      <div class="hero-grid">
        <div class="hero-card hero-left reveal">
          <div class="kicker"><span class="dot"></span> Redovno + hitno po potrebi</div>
          <h1>Održavanje zgrada koje stvarno rješava probleme.</h1>
          <p class="lead">
            Za predstavnike suvlasnika i stanare: sanacije, sitni građevinski radovi, koordinacija i intervencije —
            bez lutanja i čekanja.
          </p>
          <div class="hero-actions">
            <a class="btn primary" href="tel:${PHONE_TEL}">📞 Nazovi</a>
            <a class="btn" href="./kontakt.html">✉️ Pošalji upit</a>
          </div>
          <div class="pill-row">
            <div class="pill"><span>🧩</span> <b>Jedan kontakt</b> za više radova</div>
            <div class="pill"><span>🧯</span> <b>Intervencije</b> po dogovoru</div>
            <div class="pill"><span>📋</span> <b>Pregled</b> i plan sanacije</div>
          </div>
        </div>

        <div class="hero-card hero-right reveal">
          <div class="hero-media">
            <div class="card">
              <div class="media">
                <img src="./img/g3-odrzavanje.svg" alt="Održavanje zgrade – demo"/>
              </div>
              <div class="card pad">
                <h3>Primjeri poslova</h3>
                <p>Sanacije zidova, manji popravci, zajednički prostori, koordinacija i plan održavanja.</p>
                <div class="meta"><span class="tag">Sanacije</span><span class="tag">Popravci</span><span class="tag">Zajednički prostori</span></div>
              </div>
            </div>

            <div class="mini">
              <div class="badge">🛠️</div>
              <div>
                <h3>Plan + izvedba</h3>
                <p>Prvo procjena, zatim konkretan plan. Ne radimo “napamet”.</p>
              </div>
            </div>
            <div class="mini">
              <div class="badge">🧾</div>
              <div>
                <h3>Transparentno</h3>
                <p>Jasan opseg radova i dogovor oko prioriteta.</p>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>

    <section>
      <div class="container">
        <div class="section-head">
          <div><h2>Paketi</h2><p>Možemo složiti model održavanja po zgradi (mjesečno / kvartalno / po pozivu).</p></div>
        </div>
        <div class="grid cols3">
          <div class="card pad reveal">
            <h3>Osnovni</h3>
            <p>Periodični obilazak + lista prioriteta + sitni popravci po dogovoru.</p>
            <div class="meta"><span class="tag">Obilazak</span><span class="tag">Lista radova</span></div>
          </div>
          <div class="card pad reveal">
            <h3>Standard</h3>
            <p>Obilazak + brze intervencije + koordinacija dodatnih radova.</p>
            <div class="meta"><span class="tag">Intervencije</span><span class="tag">Koordinacija</span></div>
          </div>
          <div class="card pad reveal">
            <h3>Premium</h3>
            <p>Plan održavanja + redovne provjere + brza reakcija i izvještaj.</p>
            <div class="meta"><span class="tag">Plan</span><span class="tag">Izvještaj</span></div>
          </div>
        </div>

        <div style="margin-top:12px" class="cta reveal">
          <div class="left">
            <h3>Dogovorimo model održavanja</h3>
            <p>Pošalji adresu zgrade, broj ulaza i kratko stanje. Vratimo se s prijedlogom.</p>
          </div>
          <div style="display:flex; gap:10px; flex-wrap:wrap; justify-content:flex-end">
            <a class="btn" href="tel:${PHONE_TEL}">📞 ${PHONE_DISPLAY}</a>
            <a class="btn primary" href="./kontakt.html">✉️ Kontakt</a>
          </div>
        </div>
      </div>
    </section>
  </main>

  <footer>
    <div class="container footer-grid">
      <div>© <span id="year"></span> Gradec Gradnja</div>
      <div>📞 <a href="tel:${PHONE_TEL}">${PHONE_DISPLAY}</a> • ✉️ <a href="mailto:${EMAIL}">${EMAIL}</a></div>
    </div>
  </footer>

  <script src="./assets/app.js"></script>
</body>
</html>
HTML

# -------------------------
# kontakt.html
# -------------------------
cat > kontakt.html <<HTML
<!doctype html>
<html lang="hr">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Kontakt | Gradec Gradnja</title>
  <meta name="description" content="Kontaktiraj Gradec Gradnju: unutarnji radovi, keramika i održavanje zgrada."/>
  <meta name="theme-color" content="#0b1220" />
  <link rel="manifest" href="./manifest.webmanifest" />
  <link rel="stylesheet" href="./assets/style.css" />
  <link rel="icon" href="./img/logo-mark.svg" type="image/svg+xml" />
</head>
<body>
  <div class="blur-orb orb2"></div>
  <div class="blur-orb orb3"></div>

  <header>
    <div class="container">
      <div class="nav">
        <a class="brand" href="./index.html">
          <div class="logo"><img src="./img/logo-mark.svg" alt="" width="28" height="28"/></div>
          <div class="brand-title"><b>Gradec Gradnja</b><span>Kontakt</span></div>
        </a>
        <nav><ul>
          <li><a href="./usluge.html">Usluge</a></li>
          <li><a href="./projekti.html">Projekti</a></li>
          <li><a href="./odrzavanje.html">Održavanje</a></li>
          <li><a href="./kontakt.html">Kontakt</a></li>
        </ul></nav>
        <div class="nav-cta">
          <button class="btn ghost" id="themeBtn" type="button">☀️ Svijetlo</button>
          <a class="btn" href="tel:${PHONE_TEL}">📞 ${PHONE_DISPLAY}</a>
          <button class="btn primary menu-btn" id="menuBtn" aria-expanded="false" aria-controls="mobilePanel" type="button">☰ Izbornik</button>
        </div>
      </div>
      <div class="panel" id="mobilePanel">
        <a href="./usluge.html">Usluge</a>
        <a href="./projekti.html">Projekti</a>
        <a href="./odrzavanje.html">Održavanje</a>
        <a href="./kontakt.html">Kontakt</a>
      </div>
    </div>
  </header>

  <main>
    <div class="container hero">
      <div class="hero-grid">
        <div class="hero-card hero-left reveal">
          <div class="kicker"><span class="dot"></span> Brz odgovor • Jasna ponuda</div>
          <h1>Kontaktiraj nas</h1>
          <p class="lead">Najbrže ide kad pošalješ: opis + okvirnu kvadraturu + (ako imaš) 2–3 fotke stanja.</p>

          <div class="hero-actions">
            <a class="btn primary" href="tel:${PHONE_TEL}">📞 ${PHONE_DISPLAY}</a>
            <a class="btn" href="mailto:${EMAIL}?subject=Upit%20-%20Gradec%20Gradnja">✉️ ${EMAIL}</a>
          </div>

          <div class="card pad" style="margin-top:14px">
            <h3>Što radimo</h3>
            <p>Unutarnji radovi • Keramika • Održavanje zgrada</p>
            <div class="meta"><span class="tag">Zagreb</span><span class="tag">Okolica</span></div>
          </div>
        </div>

        <div class="hero-card hero-right reveal">
          <div class="hero-media">
            <div class="card pad">
              <h3>Pošalji upit</h3>
              <form id="inquiryForm">
                <div class="field">
                  <label for="name">Ime i prezime</label>
                  <input id="name" name="name" autocomplete="name" placeholder="npr. Ivan Horvat" required />
                </div>
                <div class="field">
                  <label for="phone">Telefon</label>
                  <input id="phone" name="phone" autocomplete="tel" placeholder="npr. 091 000 0000" required />
                </div>
                <div class="field">
                  <label for="service">Usluga</label>
                  <input id="service" name="service" placeholder="npr. keramika / adaptacija / održavanje" required />
                </div>
                <div class="field">
                  <label for="location">Lokacija</label>
                  <input id="location" name="location" placeholder="npr. Zagreb - Trešnjevka" />
                </div>
                <div class="field" style="grid-column: 1 / -1;">
                  <label for="message">Opis radova</label>
                  <textarea id="message" name="message" placeholder="Kratko opiši što treba (dimenzije, stanje, rok...)"></textarea>
                </div>
                <div class="form-actions">
                  <button class="btn primary" type="submit">🚀 Pošalji email</button>
                  <a class="btn" href="tel:${PHONE_TEL}">⚡ Radije nazovi</a>
                  <div class="hint">Forma otvara tvoj email klijent (bez servera). Za pravi web obrazac kasnije dodamo backend ili servis.</div>
                </div>
              </form>
            </div>

            <div class="card" style="overflow:hidden">
              <div class="media"><img src="./img/g4-ekipa.svg" alt="Fiktivna ekipa – demo"/></div>
              <div class="card pad">
                <h3>Impresivan dojam</h3>
                <p>Ovo je dizajn “premium” stila. Kad dodaš prave fotke, izgleda još jače.</p>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>
  </main>

  <footer>
    <div class="container footer-grid">
      <div>© <span id="year"></span> Gradec Gradnja</div>
      <div>📞 <a href="tel:${PHONE_TEL}">${PHONE_DISPLAY}</a> • ✉️ <a href="mailto:${EMAIL}">${EMAIL}</a></div>
    </div>
  </footer>

  <script src="./assets/app.js"></script>
</body>
</html>
HTML

# robots.txt (ok)
cat > robots.txt <<'ROB'
User-agent: *
Allow: /
ROB

# sitemap.xml (basic)
cat > sitemap.xml <<'MAP'
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url><loc>index.html</loc></url>
  <url><loc>usluge.html</loc></url>
  <url><loc>projekti.html</loc></url>
  <url><loc>odrzavanje.html</loc></url>
  <url><loc>kontakt.html</loc></url>
</urlset>
MAP

echo ""
echo "✅ Gotovo! Projekt je kreiran u: $(pwd)"
echo ""
echo "➡️ Otvori direktno:"
echo "   termux-open index.html"
echo ""
echo "➡️ Ili pokreni lokalni server (preporuka):"
echo "   python -m http.server 8080"
echo "   pa u browser: http://localhost:8080"
echo ""
echo "📌 Email je trenutno: ${EMAIL}"
echo "   Ako treba, promijeni u setup.sh (varijabla EMAIL) i opet pokreni setup."
