#!/data/data/com.termux/files/usr/bin/bash
set -e

SITE="$HOME/najam-alata/web/gradec-gradnja/gradec-gradnja"

cd "$SITE"

echo "🔧 Fixing Before/After slider..."

# backup
cp -f projekti.html "projekti.backup_fix_$(date +%Y%m%d_%H%M%S).html"

python - <<'PY'
import re

before = "./img/ai/ai-06-poslije.jpg"
after  = "./img/ai/ai-08-kuhinja-poslije.jpg"

fn="projekti.html"
s=open(fn,"r",encoding="utf-8",errors="ignore").read()

if "id=\"baSlider\"" in s:
    print("ℹ️ Before/After već postoji – preskačem.")
else:
    block = f'''
<section id="baSlider">
  <div class="container">
    <div class="section-head">
      <div>
        <h2>Before / After</h2>
        <p>Povuci klizač i vidi razliku nakon izvedenih radova.</p>
      </div>
    </div>

    <div class="ba-wrap reveal">
      <div class="ba-img">
        <img src="{before}" alt="Prije radova" loading="lazy"/>
        <div class="ba-after" id="baAfter" style="width:50%">
          <img src="{after}" alt="Nakon radova" loading="lazy"/>
        </div>
        <input id="baRange" class="ba-range" type="range" min="0" max="100" value="50"/>
        <div class="ba-label ba-left">PRIJE</div>
        <div class="ba-label ba-right">POSLIJE</div>
      </div>
    </div>
  </div>
</section>
'''

    s = re.sub(r'</main>', block + '\n</main>', s, count=1, flags=re.I)
    open(fn,"w",encoding="utf-8").write(s)
    print("✅ Before/After slider ubačen.")

PY

# cache bump
if [ -f sw.js ]; then
  TS=$(date +%Y%m%d_%H%M%S)
  sed -i "s/const CACHE = \"gg-cache-[^\"]*\"/const CACHE = \"gg-cache-fix-${TS}\"/g" sw.js
fi

cd ..
echo "🚀 Deploy..."
netlify deploy --prod --dir ./gradec-gradnja

echo "🎉 FIX GOTOV."
