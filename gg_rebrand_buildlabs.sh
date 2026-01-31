#!/data/data/com.termux/files/usr/bin/bash
set -e

FILES="index.html kontakt.html usluge.html projekti.html o-nama.html odrzavanje.html recenzije.html hidroponski-ai-sustavi.html admin.html hvala.html"

for f in $FILES; do
  [ -f "$f" ] || continue
  sed -i 's/Gradec Gradnja/BuildLabs Group/g' "$f"
  sed -i 's/Gradec gradnja/BuildLabs Group/g' "$f"
  sed -i 's/gradec gradnja/BuildLabs Group/g' "$f"
  sed -i 's/Gradec/BuildLabs/g' "$f"
done

# Index: title + meta description (safe replace)
python - <<'PY'
from pathlib import Path
import re

fn = Path("index.html")
s = fn.read_text(encoding="utf-8", errors="ignore")

s = re.sub(r'(?is)<title>.*?</title>',
           '<title>BuildLabs Group – Gradnja, interijeri i pametni sustavi | Zagreb</title>', s, count=1)

if re.search(r'(?is)<meta\s+name=["\']description["\']', s):
    s = re.sub(r'(?is)<meta\s+name=["\']description["\'][^>]*>',
               '<meta name="description" content="BuildLabs Group – adaptacije, interijeri, keramika, suhomontaža i pametni AI sustavi. Zagreb i okolica.">', s, count=1)
else:
    s = re.sub(r'(?is)</head>',
               '  <meta name="description" content="BuildLabs Group – adaptacije, interijeri, keramika, suhomontaža i pametni AI sustavi. Zagreb i okolica.">\n</head>', s, count=1)

fn.write_text(s, encoding="utf-8")
print("✅ index.html title/description updated")
PY

echo "✅ Rebrand na BuildLabs Group gotov."
