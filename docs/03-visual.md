🇧🇷 **Português** | 🇺🇸 [English](en/03-visual.md)

# 03 · Linguagem visual

Objetivo: um relatório que pareça produto, não planilha — legível em 5 minutos, no celular ou impresso em A4.

## Tema

| Token | Cor | Uso |
|---|---|---|
| `--bg` | `#2a2d31` | Fundo da página (cinza escuro, menos cansativo que preto puro) |
| `--card` | `#34383d` | Cards |
| `--card2` | `#3b4046` | Notas e chips neutros |
| `--line` | `#454a51` | Bordas e divisores |
| `--tx` | `#ebe9e6` | Texto principal |
| `--mu` / `--mu2` | `#a6abb2` / `#80868e` | Texto secundário / terciário |
| `--track` | `#4a4f56` | Trilho de barras e anéis |

**Tipografia:** [Inter](https://rsms.me/inter/) (fallback Noto Sans), corpo 8,9 pt, títulos 600. Página A4 sem margem (`@page{size:A4;margin:0}`) e `print-color-adjust: exact` para o fundo escuro sair no PDF.

## Semáforo

| Status | Cor | Classe |
|---|---|---|
| OK | `#6fcf97` | `.ok`, `.t-ok` |
| Atenção | `#f2c94c` | `.warn`, `.t-warn` |
| Crítico | `#eb7a7a` | `.bad`, `.t-bad` |

Usado em pontos (`.dot`), chips (`.chip`), barras (`.bar`) e no semáforo vertical dos pontos de atenção (`.light`). Exemplo de regra: uso do limite do cartão verde < 50%, amarelo 50–80%, vermelho > 80%.

## Componentes

- **Cards** (`.card`) com raio 14 px e grids `g2/g3/g4`.
- **KPIs** (`.big`, `.kpi`) com chips de contexto abaixo.
- **Barras de progresso** (`.bar > i`) — prazo do financiamento, uso de limite, parcelas pagas, categorias.
- **Barra empilhada** (`.stack`) — juros × amortização.
- **Anéis** (`.ring`, `conic-gradient` com `--p`) — distribuição de risco, geografia, classe de ativo.
- **Gauge de score** (`.gauge`) — semicírculo vermelho/amarelo/verde com agulha; ângulo = `-90° + score/1000 × 180°`.
- **Faixa de pontualidade** (`.strip`) — um bloco por parcela (em dia / com multa / carência).
- **Bloco de divergência** (`.diff`) — borda amarela, explica quando fontes não batem.

## Tags de fonte

Pequenos rótulos ao lado de cada número (`.src`):

| Tag | Classe | Significado |
|---|---|---|
| `PIERRE` | `.src.p` (azul) | Open Finance via MCP |
| `BUREAU` | `.src.s` (terracota) | Score/restrições via agente de crédito |
| `AVALIAÇÃO` | `.src.m` (verde) | Valor de mercado informado |
| `BANCO` | `.src.b` (lilás) | Extrato PDF do financiamento |
| `HIST` | `.src.h` (cinza) | Snapshot histórico (em transição) |

## Placeholders “a conectar”

Dado ausente nunca vira número estimado. Três formas:

- texto `a conectar` em `.muted` numa célula;
- `.ph-box` — caixa tracejada com a explicação do que falta;
- `.bar.ph` — barra listrada para métricas ainda sem fonte.

Um selo **“Exemplo · dados 100% fictícios”** (`.fake`) aparece no topo de cada página do template público.
