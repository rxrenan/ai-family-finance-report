🇧🇷 [Português](../03-visual.md) | 🇺🇸 **English**

# 03 · Visual language

Goal: a report that feels like a product, not a spreadsheet — readable in 5 minutes, on a phone or printed on A4.

## Theme

| Token | Color | Usage |
|---|---|---|
| `--bg` | `#2a2d31` | Page background (dark gray, easier on the eyes than pure black) |
| `--card` | `#34383d` | Cards |
| `--card2` | `#3b4046` | Notes and neutral chips |
| `--line` | `#454a51` | Borders and dividers |
| `--tx` | `#ebe9e6` | Primary text |
| `--mu` / `--mu2` | `#a6abb2` / `#80868e` | Secondary / tertiary text |
| `--track` | `#4a4f56` | Track for bars and rings |

**Typography:** [Inter](https://rsms.me/inter/) (Noto Sans fallback), 8.9 pt body, 600-weight headings. Borderless A4 page (`@page{size:A4;margin:0}`) and `print-color-adjust: exact` so the dark background makes it into the PDF.

## Traffic light

| Status | Color | Class |
|---|---|---|
| OK | `#6fcf97` | `.ok`, `.t-ok` |
| Warning | `#f2c94c` | `.warn`, `.t-warn` |
| Critical | `#eb7a7a` | `.bad`, `.t-bad` |

Used in dots (`.dot`), chips (`.chip`), bars (`.bar`), and in the vertical traffic light of the attention points (`.light`). Example rule: card limit usage green < 50%, yellow 50–80%, red > 80%.

## Components

- **Cards** (`.card`) with a 14 px radius and `g2/g3/g4` grids.
- **KPIs** (`.big`, `.kpi`) with context chips below.
- **Progress bars** (`.bar > i`) — mortgage term, limit usage, installments paid, categories.
- **Stacked bar** (`.stack`) — interest × principal.
- **Rings** (`.ring`, `conic-gradient` with `--p`) — risk distribution, geography, asset class.
- **Score gauge** (`.gauge`) — red/yellow/green semicircle with a needle; angle = `-90° + score/1000 × 180°`.
- **Punctuality strip** (`.strip`) — one block per installment (on time / with penalty / grace period).
- **Discrepancy block** (`.diff`) — yellow border, explains when sources don't match.

## Source tags

Small labels next to each number (`.src`):

| Tag | Class | Meaning |
|---|---|---|
| `PIERRE` | `.src.p` (blue) | Open Finance via MCP |
| `BUREAU` | `.src.s` (terracotta) | Score/negative records via the credit agent |
| `AVALIAÇÃO` | `.src.m` (green) | Provided market value (appraisal) |
| `BANCO` | `.src.b` (lilac) | Mortgage PDF statement (bank) |
| `HIST` | `.src.h` (gray) | Historical snapshot (in transition) |

## “a conectar” placeholders

Missing data never becomes an estimated number. “a conectar” means “to be connected”. Three forms:

- the text `a conectar` in `.muted` inside a cell;
- `.ph-box` — dashed box explaining what is missing;
- `.bar.ph` — striped bar for metrics that don't have a source yet.

A **“Exemplo · dados 100% fictícios”** (“Example · 100% fictitious data”) badge (`.fake`) appears at the top of every page of the public template.
