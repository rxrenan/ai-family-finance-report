#!/usr/bin/env bash
# Renderiza o template HTML em PDF A4 (+ PNG da página 1).
# Uso: ./scripts/render.sh [entrada.html] [saida.pdf]
# Motor: Chromium/Chrome headless (padrão) ou WeasyPrint (ENGINE=weasyprint).
set -euo pipefail
cd "$(dirname "$0")/.."
IN="${1:-template/relatorio-template.html}"
OUT="${2:-examples/relatorio-exemplo.pdf}"
PNG="$(dirname "$OUT")/preview-p1"
ENGINE="${ENGINE:-chromium}"
mkdir -p "$(dirname "$OUT")"

if [[ "$ENGINE" == "weasyprint" ]]; then
  weasyprint "$IN" "$OUT"
else
  CHROME="${CHROME:-$(command -v chromium || command -v chromium-browser || command -v google-chrome || true)}"
  [[ -z "$CHROME" ]] && { echo "Chromium/Chrome não encontrado. Use ENGINE=weasyprint." >&2; exit 1; }
  "$CHROME" --headless=new --no-sandbox --disable-gpu --no-pdf-header-footer \
    --virtual-time-budget=5000 --print-to-pdf="$PWD/$OUT" "file://$PWD/$IN" 2>/dev/null
fi

# Preview da página 1 (requer poppler-utils)
if command -v pdftoppm >/dev/null; then
  pdftoppm -f 1 -l 1 -r 110 -png -singlefile "$OUT" "$PNG"
  echo "Pronto: $OUT e $PNG.png"
else
  echo "Pronto: $OUT (instale poppler-utils para gerar o PNG)"
fi
