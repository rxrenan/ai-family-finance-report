🇧🇷 [Português](../01-conexoes.md) | 🇺🇸 **English**

# 01 · Connections and data sources

## Primary source: Pierre Finance (Open Finance MCP)

[Pierre Finance](https://docs.pierre.finance) is an Open Finance aggregator that exposes connected accounts through an **MCP server** (Model Context Protocol). The assistant calls the MCP tools as if they were functions.

### Tools used (read-only)

| Tool | Purpose in the report |
|---|---|
| `getAccounts` | Lists connected accounts and cards (section 10) |
| `getBalance` | Consolidated balance (section 01) |
| `getBalanceByAccount` | Balance per account, to detect overdrawn accounts (sections 01 and 10) |
| `getBankStatement` | Transactions for the period: week, categories, subscriptions (sections 02 and 04) |
| `getBills` | Credit card bills, limits, and minimum payments (section 05) |
| `getBillSummary` | Summary of open bills (section 01) |
| `getInstallments` | Installment purchases and remaining installments (section 06) |

### Tool deliberately avoided: `manualUpdate`

`manualUpdate` forces a sync with the institutions. It is **kept out of the routine** on purpose:

- the report must be **read-only** and reproducible;
- forced syncs may carry costs, rate limits, or side effects;
- if data is stale, the report states the time of the last read instead of “fixing” it on its own.

> Tool names are the ones exposed by the MCP when this case was built. Check the official documentation — they may change.

### How to connect an MCP to the assistant

1. Create a Pierre account and connect banks and cards in the dashboard (Open Finance consent).
2. Generate an **API key** in the dashboard.
3. Store the key in an environment variable — never in code or in the repository:
   ```bash
   cp .env.example .env   # and fill in PIERRE_API_KEY
   ```
4. Register the MCP server in the assistant. According to the public documentation, the endpoint is StreamableHTTP with Bearer authentication:
   ```json
   {
     "mcpServers": {
       "pierre-finance": {
         "url": "https://pierre.finance/mcp",
         "headers": { "Authorization": "Bearer ${PIERRE_API_KEY}" }
       }
     }
   }
   ```
   Clients that only speak stdio can use a bridge such as `mcp-remote`.
5. In the assistant, **restrict the report agent to the 7 tools above** (allowlist). If the client supports it, mark `manualUpdate` as blocked.
6. Test with a simple request: “list my connected accounts with the last 4 digits”.

## Complementary sources

Open Finance doesn't cover everything. Three sources complete the picture:

### Credit score (bureau) — via a separate agent

- Read by a **family finance agent**, which owns the sensitive credit data (see [02-routine.md](02-routine.md)).
- The report agent receives only the **aggregate**: score, band, number/amount of negative records, flags — already masked.
- Report tag: `BUREAU`.

### Mortgage statement — PDF via `pdftotext`

- The bank provides the full contract statement as a PDF.
- Text extraction preserving columns:
  ```bash
  pdftotext -layout data/extrato-financiamento.pdf data/extrato.txt
  ```
- The assistant reads the text and extracts outstanding balance, installments paid, interest × principal, insurance, fees, penalties, and payment punctuality.
- The PDF and TXT live in `data/` (ignored by git). Tag: `BANCO`.

### Property value — provided market appraisal

- There is no reliable API for this; the value is **provided by the family** based on a current market appraisal.
- The report makes it explicit that this is a provided value (tag `AVALIAÇÃO`) and shows the purchase price alongside it for reference.

### Historical snapshot — transition

- Until the old source is fully replaced, some numbers come from a snapshot (tag `HIST`), always dated. The goal is to phase this tag out over time.
