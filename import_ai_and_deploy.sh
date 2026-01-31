#!/data/data/com.termux/files/usr/bin/bash
set -e

ROOT="$HOME/najam-alata/web/gradec-gradnja"
SITE="$ROOT/gradec-gradnja"
AIDIR="$SITE/img/ai"

mkdir -p "$AIDIR"

FILES=(
  ai-01-hero-interijer.jpg
  ai-02-hero-keramika.jpg
  ai-03-hero-odrzavanje.jpg
  ai-04-hero-ekipa.jpg
  ai-05-prije.jpg
  ai-06-poslije.jpg
  ai-07-kuhinja-prije.jpg
  ai-08-kuhinja-poslije.jpg
  ai-09-gletanje.jpg
  ai-10-krecenje.jpg
  ai-11-knauf-strop.jpg
  ai-12-knauf-pregrada.jpg
  ai-13-keramika-pod.jpg
  ai-14-fuge.jpg
  ai-15-parket.jpg
  ai-16-stubiste.jpg
  ai-17-odvod.jpg
  ai-18-rasvjeta.jpg
  ai-19-vrata.jpg
  ai-20-hitna-intervencija.jpg
)

echo "➡️ Kopiram iz Downloads u $AIDIR (ako postoji)..."
for f in "${FILES[@]}"; do
  if [ -f "/storage/emulated/0/Download/$f" ]; then
    cp -f "/storage/emulated/0/Download/$f" "$AIDIR/$f"
  fi
done

echo ""
echo "📦 Trenutno u img/ai:"
ls -lh "$AIDIR" || true

echo ""
echo "🔎 Provjera nedostajućih:"
missing=0
for f in "${FILES[@]}"; do
  if [ ! -f "$AIDIR/$f" ]; then
    echo "❌ NEDOSTAJE: $f"
    missing=1
  fi
done

if [ "$missing" -eq 1 ]; then
  echo ""
  echo "⚠️ Neke slike fale."
  echo "Generiraj ih, DOWNLOAD u Downloads i PREIMENUJ točno kako piše, pa pokreni opet:"
  echo "bash import_ai_and_deploy.sh"
  exit 0
fi

# Cache bump (da se nove slike vide odmah)
if [ -f "$SITE/sw.js" ]; then
  TS=$(date +%Y%m%d_%H%M%S)
  sed -i "s/const CACHE = \"gg-cache-[^\"]*\"/const CACHE = \"gg-cache-ai-${TS}\"/g" "$SITE/sw.js" || true
fi

echo "🚀 Deploy na Netlify..."
cd "$ROOT"
netlify deploy --prod --dir ./gradec-gradnja

echo "🎉 GOTOVO."
echo "Ako vidiš staro: Browser -> Site settings -> Clear storage, pa refresh."
