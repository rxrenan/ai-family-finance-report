🇧🇷 [Português](../05-privacidade.md) | 🇺🇸 **English**

# 05 · Privacy and masking

Family financial data is among the most sensitive data there is. The rules below apply to the **PDF, the chat, the logs, and the repository**.

## Masking rules

| Data | Rule | Example |
|---|---|---|
| CPF (Brazilian tax ID) | Always fully masked | `***.***.***-XX` |
| Bank account | Last 4 digits only | `Conta Banco A ···1001` |
| Card | Last 4 digits only | `Cartão ···3003` |
| Contract (mortgage, debts) | No number; at most “ending XXXX” | `Contrato final XXXX` |
| Address | **Never** shown — neither the property's nor the home address | “location omitted” |
| Third-party names (Pix, individual creditors) | Replace with the category | `Pix · Mensalidade escolar` (school tuition) |
| Employer / income source | Not shown; use “salary” | — |
| Debt and negative-record details | Aggregates only in the report; details stay with the credit agent | “2 negative records · R$ X” |

> Examples in `code` are shown as they appear in the pt-BR report.

## Masking in code

Defense in depth: in addition to the prompt, apply a function before rendering.

```python
import re
def mask(text: str) -> str:
    text = re.sub(r"\d{3}\.?\d{3}\.?\d{3}-?\d{2}", "***.***.***-XX", text)   # CPF
    return re.sub(r"\b\d{4,}(\d{4})\b", r"···\1", text)                     # accounts/cards
```

And a final *check* on the PDF before delivery:

```bash
pdftotext examples/relatorio-exemplo.pdf - | grep -E "[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}" && echo "CPF exposed!" && exit 1
```

## Sharing in the family group

1. The assistant **does not send** the report on its own: it delivers it for review.
2. A responsible adult reviews the PDF and the summary.
3. Only then does the PDF go to the **private family group** (only the adults who make financial decisions).
4. Detailed credit data does **not** go to the group — only the aggregate from section 07.
5. Old PDFs are not kept in public folders or repositories.

## Repository

- `data/` and any `*.real.*` file are in `.gitignore`.
- `.env` (with `PIERRE_API_KEY`) is never committed; use `.env.example`.
- The public template uses **only** fictitious data (Silva Family, Bank A/B/C, round numbers).
