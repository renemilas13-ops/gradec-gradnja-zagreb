#!/data/data/com.termux/files/usr/bin/bash
set -e

ROOT="$HOME/najam-alata/web/gradec-gradnja"
SITE="$ROOT/gradec-gradnja"
cd "$SITE"

echo "🔧 Fix hero list -> img/hero/hero-01..05.jpg"

python - <<'PY'
import re, json

new = [
  "./img/hero/hero-01.jpg",
  "./img/hero/hero-02.jpg",
  "./img/hero/hero-03.jpg",
  "./img/hero/hero-04.jpg",
  "./img/hero/hero-05.jpg"
]

fn="index.html"
s=open(fn,"r",encoding="utf-8",errors="ignore").read()

pattern = r'window\.__GG_HERO_IMAGES\s*=\s*\[[\s\S]*?\]\s*;'
repl = 'window.__GG_HERO_IMAGES = ' + json.dumps(new) + ';'

if re.search(pattern, s):
    s = re.sub(pattern, repl, s, count=1)
else:
    s = s.replace('<script src="./assets/app.js"></script>',
                  f'<script>\\n{repl}\\n</script>\\n  <script src="./assets/app.js"></script>')

open(fn,"w",encoding="utf-8").write(s)
print("✅ index.html updated")
PY

# (opcionalno) stavi OG preview na hero-01
for f in *.html; do
  [ -f "$f" ] || continue
  if grep -q 'property="og:image"' "$f"; then
    sed -i 's#<meta property="og:image" content="[^"]*" />#<meta property="og:image" content="./img/hero/hero-01.jpg" />#' "$f" || true
  fi
done

# cache bump
if [ -f sw.js ]; then
  TS=$(date +%Y%m%d_%H%M%S)
  sed -i "s/const CACHE = \"gg-cache-[^\"]*\"/const CACHE = \"gg-cache-hero-${TS}\"/g" sw.js || true
fi

echo "🚀 Deploy..."
cd "$ROOT"
netlify deploy --prod --dir ./gradec-gradnja
echo "🎉 HERO slider fixed + deployed."
