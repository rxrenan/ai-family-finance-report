🇧🇷 **Português** | 🇺🇸 [English](en/04-sections.md)

# 04 · As 10 seções do relatório

| # | Seção | Página | Fontes | O que responde |
|---|---|---|---|---|
| 01 | **Patrimônio bruto/líquido** | 1 | PIERRE · AVALIAÇÃO · BANCO · HIST | Quanto a família tem, quanto deve e como o patrimônio se distribui |
| 02 | **Semana** | 1 | PIERRE | Quanto entrou e saiu na semana e quais foram os maiores lançamentos |
| 03 | **Financiamento** | 2 | BANCO | Saldo devedor, próxima parcela, progresso, juros × amortização, pontualidade |
| 04 | **Fluxo de caixa** | 3 | PIERRE · HIST | Receita × despesa do mês, por categoria, assinaturas e divergências entre fontes |
| 05 | **Cartões** | 4 | PIERRE | Fatura, mínimo, limite e uso do limite por cartão |
| 06 | **Parcelamentos** | 4 | PIERRE | Quanto falta pagar, quantas compras ativas, quais terminam logo |
| 07 | **Crédito/score** | 5 | BUREAU | Score, restrições e monitoramento (só agregado e mascarado) |
| 08 | **Pontos de atenção** | 5 | todas | O que merece ação agora, com semáforo, severidade e ação sugerida |
| 09 | **Análise de portfólio** | 6 | HIST · AVALIAÇÃO | Concentração, liquidez, reserva de emergência (leitura educativa) |
| 10 | **Contas conectadas** | 6 | PIERRE · HIST | Quais instituições estão conectadas, por qual via, e o que falta conectar |

## Detalhes por seção

**01 · Patrimônio** — líquido = bruto − saldo devedor. Deixa explícito o que **não** foi descontado (ex.: faturas em aberto), porque vem de outra fonte. Anéis de risco, geografia e classe de ativo.

**02 · Semana** — três KPIs (gastos, entradas, saldo) e top lançamentos com categoria e origem (conta/cartão, 4 últimos dígitos).

**03 · Financiamento** — extraído do PDF do banco: saldo, parcela e vencimento, atrasos, multas, barra do prazo, barra empilhada juros × amortização, faixa de pontualidade. Endereço do imóvel e número do contrato nunca aparecem.

**04 · Fluxo de caixa** — duas leituras lado a lado quando há duas fontes, com bloco `.diff` explicando a divergência. Categorias em barras relativas à maior. Assinaturas em chips, com alerta de possível duplicidade.

**05 · Cartões** — tabela com uso do limite colorido pela regra do semáforo. Total marcado como estimativa até o fechamento.

**06 · Parcelamentos** — KPIs + tabela com progresso por compra. Parcelas que a integração não detalha ficam como “a conectar”.

**07 · Crédito** — gauge 0–1000, restrições, monitoramento. Segundo titular aparece como card tracejado “a conectar” se não houver dados.

**08 · Pontos de atenção** — lista ordenada por severidade (Alto → Baixo). Cada item: título com número, tag de fonte, contexto e **ação sugerida** — sempre educativa.

**09 · Portfólio** — concentração em imóvel, % volátil, reserva (meses) vs. meta, custo de oportunidade. Fecha com uma “leitura neutra”.

**10 · Contas conectadas** — inventário de fontes: o que cada uma diz, divergências e o que falta conectar. É a seção que dá confiança ao resto.
