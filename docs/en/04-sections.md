🇧🇷 [Português](../04-secoes.md) | 🇺🇸 **English**

# 04 · The report's 10 sections

| # | Section | Page | Sources | What it answers |
|---|---|---|---|---|
| 01 | **Gross/net worth** | 1 | PIERRE · AVALIAÇÃO · BANCO · HIST | What the family owns, what it owes, and how its assets are distributed |
| 02 | **Week** | 1 | PIERRE | How much came in and went out during the week, and the largest transactions |
| 03 | **Mortgage** | 2 | BANCO | Outstanding balance, next installment, progress, interest × principal, punctuality |
| 04 | **Cash flow** | 3 | PIERRE · HIST | Income × expenses for the month, by category, subscriptions, and discrepancies between sources |
| 05 | **Credit cards** | 4 | PIERRE | Bill, minimum payment, limit, and limit usage per card |
| 06 | **Installments** | 4 | PIERRE | How much is left to pay, how many active purchases, which ones end soon |
| 07 | **Credit/score** | 5 | BUREAU | Score, negative records, and monitoring (aggregated and masked only) |
| 08 | **Attention points** | 5 | all | What needs action now, with traffic light, severity, and suggested action |
| 09 | **Portfolio analysis** | 6 | HIST · AVALIAÇÃO | Concentration, liquidity, emergency fund (educational reading) |
| 10 | **Connected accounts** | 6 | PIERRE · HIST | Which institutions are connected, through which channel, and what is still missing |

## Section details

**01 · Net worth** — net = gross − outstanding mortgage balance. Makes explicit what was **not** deducted (e.g., open card bills), since it comes from a different source. Rings for risk, geography, and asset class.

**02 · Week** — three KPIs (spending, income, balance) and top transactions with category and origin (account/card, last 4 digits).

**03 · Mortgage** — extracted from the bank's PDF: balance, installment and due date, late payments, penalties, term bar, interest × principal stacked bar, punctuality strip. The property address and contract number never appear.

**04 · Cash flow** — two readings side by side when there are two sources, with a `.diff` block explaining the discrepancy. Categories as bars relative to the largest one. Subscriptions as chips, with a possible-duplicate alert.

**05 · Credit cards** — table with limit usage colored by the traffic-light rule. Total flagged as an estimate until the bill closes.

**06 · Installments** — KPIs + table with progress per purchase. Installments the integration doesn't detail are shown as “a conectar” (“to be connected”).

**07 · Credit** — 0–1000 gauge, negative records, monitoring. A second account holder appears as a dashed “a conectar” card if there is no data.

**08 · Attention points** — list sorted by severity (High → Low). Each item: title with a number, source tag, context, and a **suggested action** — always educational.

**09 · Portfolio** — concentration in real estate, % in volatile assets, emergency fund (months) vs. target, opportunity cost. Closes with a “neutral reading”.

**10 · Connected accounts** — source inventory: what each one says, discrepancies, and what is still missing. This is the section that makes the rest trustworthy.
