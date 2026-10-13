🇧🇷 **Português** | 🇺🇸 [English](en/01-connections.md)

# 01 · Conexões e fontes de dados

## Fonte principal: Pierre Finance (MCP de Open Finance)

A [Pierre Finance](https://docs.pierre.finance) é um agregador de Open Finance que expõe as contas conectadas por meio de um **servidor MCP** (Model Context Protocol). O assistente chama as ferramentas do MCP como se fossem funções.

### Ferramentas usadas (somente leitura)

| Ferramenta | Para que serve no relatório |
|---|---|
| `getAccounts` | Lista contas e cartões conectados (seção 10) |
| `getBalance` | Saldo consolidado (seção 01) |
| `getBalanceByAccount` | Saldo por conta, para detectar contas negativas (seções 01 e 10) |
| `getBankStatement` | Lançamentos do período: semana, categorias, assinaturas (seções 02 e 04) |
| `getBills` | Faturas de cartão, limites e mínimos (seção 05) |
| `getBillSummary` | Resumo das faturas em aberto (seção 01) |
| `getInstallments` | Compras parceladas e parcelas restantes (seção 06) |

### Ferramenta evitada: `manualUpdate`

`manualUpdate` força uma sincronização com as instituições. Ela **fica fora da rotina** de propósito:

- o relatório deve ser **read-only** e reprodutível;
- sincronizações forçadas podem ter custo, limite de uso ou efeitos colaterais;
- se os dados estiverem desatualizados, o relatório informa o horário da última leitura em vez de “consertar” sozinho.

> Os nomes das ferramentas são os expostos pelo MCP quando o case foi montado. Confira a documentação oficial — eles podem mudar.

### Como conectar um MCP no assistente

1. Crie a conta na Pierre e conecte bancos e cartões pelo painel (consentimento de Open Finance).
2. Gere uma **API key** no painel.
3. Guarde a chave em variável de ambiente — nunca no código nem no repositório:
   ```bash
   cp .env.example .env   # e preencha PIERRE_API_KEY
   ```
4. Cadastre o servidor MCP no assistente. Segundo a documentação pública, o endpoint é StreamableHTTP com autenticação Bearer:
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
   Clientes que só falam stdio podem usar uma ponte como `mcp-remote`.
5. No assistente, **restrinja o agente do relatório às 7 ferramentas acima** (allowlist). Se o cliente permitir, marque `manualUpdate` como bloqueada.
6. Teste com um pedido simples: “liste minhas contas conectadas com os 4 últimos dígitos”.

## Fontes complementares

O Open Finance não cobre tudo. Três fontes completam o quadro:

### Score de crédito (bureau) — via agente separado

- Lido por um **agente de finanças da família**, dono dos dados sensíveis de crédito (veja [02-rotina.md](02-rotina.md)).
- O agente do relatório recebe só o **agregado**: score, faixa, quantidade/valor de restrições, flags — já mascarado.
- Tag no relatório: `BUREAU`.

### Extrato do financiamento imobiliário — PDF via `pdftotext`

- O banco disponibiliza o extrato completo do contrato em PDF.
- Extração de texto preservando colunas:
  ```bash
  pdftotext -layout data/extrato-financiamento.pdf data/extrato.txt
  ```
- O assistente lê o texto e extrai saldo devedor, parcelas pagas, juros × amortização, seguros, taxas, multas e pontualidade.
- O PDF e o TXT ficam em `data/` (ignorado pelo git). Tag: `BANCO`.

### Valor do imóvel — avaliação de mercado informada

- Não existe API confiável para isso; o valor é **informado pela família** com base em avaliação de mercado atual.
- O relatório deixa explícito que é um valor informado (tag `AVALIAÇÃO`) e mostra o valor de compra ao lado, como referência.

### Snapshot histórico — transição

- Enquanto a fonte antiga não foi totalmente substituída, alguns números vêm de um snapshot (tag `HIST`), sempre com data. O objetivo é zerar essa tag com o tempo.
