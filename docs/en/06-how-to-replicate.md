🇧🇷 [Português](../06-como-replicar.md) | 🇺🇸 **English**

# 06 · How to replicate

## Prerequisites

- An AI assistant with **MCP** and **scheduling** support (this case uses Grok Bot).
- A **Pierre Finance** account with banks/cards connected via Open Finance and an API key.
- `bash`, **Chromium/Chrome** (or WeasyPrint), and `poppler-utils` (`pdftotext`, `pdftoppm`).
- The **Inter** font installed (optional; falls back to Noto Sans/sans-serif).

## Step by step

1. **Clone and set up**
   ```bash
   git clone <this-repo> && cd ai-family-finance-report
   cp .env.example .env          # fill in PIERRE_API_KEY
   mkdir -p data                 # real data lives here (ignored by git)
   ```
2. **Render the example** to validate your environment:
   ```bash
   ./scripts/render.sh                       # Chromium
   ENGINE=weasyprint ./scripts/render.sh     # alternative
   ```
   Output: `examples/relatorio-exemplo.pdf` and `examples/preview-p1.png`.
3. **Connect the Pierre MCP** to the assistant ([01-connections.md](01-connections.md)) and restrict it to read-only tools.
4. **Test reading:** ask “list my accounts with the last 4 digits and the balance of each one”.
5. **Complementary sources (optional):**
   - save the mortgage statement in `data/` and run `pdftotext -layout`;
   - provide the property's market appraisal;
   - set up a separate agent for the credit score.
6. **Create the routine:** schedule it for **Monday at 8:07 AM** with the prompt in [`prompts/en/weekly-routine.md`](../../prompts/en/weekly-routine.md). The assistant should generate `data/relatorio-YYYY-MM-DD.real.html` and render it:
   ```bash
   ./scripts/render.sh data/relatorio-2026-10-12.real.html data/relatorio-2026-10-12.real.pdf
   ```
7. **Review** the PDF (numbers, tags, masking) and only then share it.
8. **Iterate:** each week, replace one “a conectar” (“to be connected”) with a real source and phase out the `HIST` tags.

## Pre-sharing checklist

- [ ] Every number has a source tag.
- [ ] No CPF, full account/card number, address, or contract number.
- [ ] Discrepancies between sources explained.
- [ ] Missing data shown as “a conectar”, never estimated.
- [ ] Attention points with a suggested action and an educational-content disclaimer.
