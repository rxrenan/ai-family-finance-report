🇧🇷 **Português** | 🇺🇸 [English](en/05-privacy.md)

# 05 · Privacidade e mascaramento

Dados financeiros de família são dos mais sensíveis que existem. As regras abaixo valem para o **PDF, o chat, os logs e o repositório**.

## Regras de mascaramento

| Dado | Regra | Exemplo |
|---|---|---|
| CPF | Sempre mascarado por completo | `***.***.***-XX` |
| Conta bancária | Só os 4 últimos dígitos | `Conta Banco A ···1001` |
| Cartão | Só os 4 últimos dígitos | `Cartão ···3003` |
| Contrato (financiamento, dívidas) | Sem número; no máximo “final XXXX” | `Contrato final XXXX` |
| Endereço | **Nunca** aparece — nem do imóvel, nem residencial | “localização omitida” |
| Nomes de terceiros (Pix, credores pessoa física) | Substituir pela categoria | `Pix · Mensalidade escolar` |
| Empregador / fonte de renda | Não aparece; usar “salário” | — |
| Detalhes de dívidas e restrições | Só agregados no relatório; detalhe fica com o agente de crédito | “2 restrições · R$ X” |

## Mascaramento em código

Defesa em profundidade: além do prompt, aplique uma função antes de renderizar.

```python
import re
def mascarar(texto: str) -> str:
    texto = re.sub(r"\d{3}\.?\d{3}\.?\d{3}-?\d{2}", "***.***.***-XX", texto)   # CPF
    return re.sub(r"\b\d{4,}(\d{4})\b", r"···\1", texto)                       # contas/cartões
```

E um *check* final no PDF antes da entrega:

```bash
pdftotext examples/relatorio-exemplo.pdf - | grep -E "[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}" && echo "CPF exposto!" && exit 1
```

## Compartilhamento no grupo da família

1. O assistente **não envia** o relatório sozinho: entrega para revisão.
2. Um adulto responsável revisa o PDF e o resumo.
3. Só então o PDF vai para o **grupo privado da família** (somente os adultos que tomam decisões financeiras).
4. Dados de crédito detalhados **não** vão para o grupo — só o agregado da seção 07.
5. PDFs antigos não ficam em pastas públicas nem em repositórios.

## Repositório

- `data/` e qualquer arquivo `*.real.*` estão no `.gitignore`.
- `.env` (com `PIERRE_API_KEY`) nunca é commitado; use `.env.example`.
- O template público usa **somente** dados fictícios (Família Silva, Banco A/B/C, valores redondos).
