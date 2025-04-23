# 🤖 Monitoramento do Chatbot - Testes Automatizados

Este repositório contém teste automatizado que monitora a disponibilidade do chatbot da [Machine.global](https://machine.global). Os testes são executados automaticamente a cada 12 horas utilizando GitHub Actions, e notificam via Discord e e-mail **em caso de falhas**.

---

## ✨ Objetivo

Garantir que o chatbot da Machine.global — responsável por iniciar contatos com potenciais clientes — esteja sempre disponível. Uma falha nesse canal de entrada representa perda direta de oportunidades de venda, por isso a automação atua de forma preventiva, validando o funcionamento do chatbot continuamente.

---

## 🛠️ Tecnologias Utilizadas

- [Robot Framework](https://robotframework.org/)
- [SeleniumLibrary](http://robotframework.org/SeleniumLibrary/)
- [GitHub Actions](https://github.com/features/actions)
- [Discord Webhook](https://support.discord.com/hc/pt-br/articles/228383668)
- Envio de e-mails via SMTP (com [dawidd6/action-send-mail](https://github.com/dawidd6/action-send-mail))
- Python 3.10+

---

## 🚀 Como Funciona

1. A automação acessa o site [machine.global](https://machine.global)
2. Simula a interação real com o chatbot
3. Valida o fluxo completo até a exibição do link de WhatsApp
4. Em caso de falha:
   - Envia notificação no Discord
   - Envia relatório detalhado por e-mail com os arquivos `log.html`, `report.html`, e `output.xml`

---

## 📅 Agendamento Automático

A execução é feita por agendamento via GitHub Actions com a seguinte configuração:

  ```yaml`
on:
  schedule:
    - cron: '0 */12 * * *'  # Executa às 00:00 e 12:00 UTC
  workflow_dispatch:  # Permite execução manual```

## 📬 Notificações

✅ Testes bem-sucedidos: uma mensagem é enviada para o canal do Discord.

❌ Falhas detectadas:
- Alerta é enviado ao canal #monitoramento-chatbot
- E-mail com relatório completo é enviado para os responsáveis.

---

## 🔐 Privacidade e Segurança

Este repositório não contém dados sensíveis nem logs de execução com informações reais.
Arquivos como log.html, report.html e output.xml são gerados dinamicamente apenas durante a execução do GitHub Actions, e estão listados no .gitignore, garantindo que não sejam versionados ou expostos publicamente.

O envio de relatórios por e-mail e notificações no Discord são realizados em tempo de execução, utilizando credenciais armazenadas de forma segura via GitHub Secrets.

---

## 👤 Autor

Este projeto foi desenvolvido por Helane Moura como iniciativa interna da Gaudium, com o objetivo de melhorar a confiabilidade em um dos canais de aquisição de clientes.

---

## 💡 Observações

Este projeto pode servir como base para monitoramento de outros fluxos críticos via UI (como checkout, formulários, chat, login etc.), com alertas integrados em múltiplos canais.
