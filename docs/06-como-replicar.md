🇧🇷 **Português** | 🇺🇸 [English](en/06-how-to-replicate.md)

# 06 · Como replicar

## Pré-requisitos

- Um assistente de IA com suporte a **MCP** e **agendamento** (o case usa o Grok Bot).
- Conta na **Pierre Finance** com bancos/cartões conectados via Open Finance e uma API key.
- `bash`, **Chromium/Chrome** (ou WeasyPrint) e `poppler-utils` (`pdftotext`, `pdftoppm`).
- Fonte **Inter** instalada (opcional; cai para Noto Sans/sans-serif).

## Passo a passo

1. **Clone e prepare**
   ```bash
   git clone <este-repo> && cd ai-family-finance-report
   cp .env.example .env          # preencha PIERRE_API_KEY
   mkdir -p data                 # dados reais ficam aqui (ignorado pelo git)
   ```
2. **Renderize o exemplo** para validar o ambiente:
   ```bash
   ./scripts/render.sh                       # Chromium
   ENGINE=weasyprint ./scripts/render.sh     # alternativa
   ```
   Saída: `examples/relatorio-exemplo.pdf` e `examples/preview-p1.png`.
3. **Conecte o MCP da Pierre** no assistente ([01-conexoes.md](01-conexoes.md)) e restrinja às ferramentas de leitura.
4. **Teste a leitura:** peça “liste minhas contas com os 4 últimos dígitos e o saldo de cada uma”.
5. **Fontes complementares (opcional):**
   - salve o extrato do financiamento em `data/` e rode `pdftotext -layout`;
   - informe a avaliação de mercado do imóvel;
   - configure um agente separado para o score de crédito.
6. **Crie a rotina:** agende para **segunda 8h07** com o prompt de [`prompts/rotina-semanal.md`](../prompts/rotina-semanal.md). O assistente deve gerar `data/relatorio-AAAA-MM-DD.real.html` e renderizar:
   ```bash
   ./scripts/render.sh data/relatorio-2026-10-12.real.html data/relatorio-2026-10-12.real.pdf
   ```
7. **Revise** o PDF (números, tags, mascaramento) e só então compartilhe.
8. **Itere:** a cada semana, troque um “a conectar” por uma fonte real e zere as tags `HIST`.

## Checklist antes de compartilhar

- [ ] Todo número tem tag de fonte.
- [ ] Nenhum CPF, conta/cartão completo, endereço ou número de contrato.
- [ ] Divergências entre fontes explicadas.
- [ ] Dados ausentes como “a conectar”, nunca estimados.
- [ ] Pontos de atenção com ação sugerida e aviso de conteúdo educativo.
