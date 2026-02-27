# GDD - HabitUp: Onde a Disciplina Encontra o Bem-Estar

## 1. Visão Geral do Produto
O **HabitUp** é uma aplicação web de produtividade e saúde mental. A sua proposta de valor reside na união de três conceitos de sucesso:
* **Gamificação Estilo Duolingo:** Ofensivas (streaks) e progressão visual viciante.
* **Rastreamento Emocional Estilo Daylio:** Registo de humor e atividades através de micro-interações (emojis e tags).
* **RPG de Hábitos Estilo Habitica:** Transformação de tarefas em batalhas contra "Bosses" e evolução de personagem.

---

## 2. Mecânicas de Jogo (Core Gameplay)

### 2.1. O Ciclo do Hábito (Duo Mode)
* **Streaks (Ofensivas):** Contagem de dias consecutivos de conclusão. Perder um dia resulta no "congelamento" ou perda da ofensiva.
* **XP (Experiência):** Cada hábito concluído gera XP. Hábitos mais difíceis geram mais XP.
* **Níveis:** O utilizador sobe de nível, desbloqueando novas skins e itens para o seu avatar.

### 2.2. O Ciclo do Bem-Estar (Daylio Mode)
* **Mood Tracker:** Registo diário obrigatório (ou sugerido) numa escala de 1 a 5 (Triste, Mal, Neutro, Bem, Feliz).
* **Activity Tags:** Seleção de etiquetas (Social, Trabalho, Lazer, Saúde) para identificar gatilhos de humor.
* **Correlação Inteligente:** O sistema cruza dados para mostrar, por exemplo, que o humor melhora quando o hábito "Caminhada" é realizado.

### 2.3. Sistema de Bosses (Boss Mode)
Os Bosses são desafios temporários que personificam vilões da produtividade.
1.  **General Procrastinação:** Derrotado por hábitos de Foco/Estudo.
2.  **Névoa da Ansiedade:** Dissipada por hábitos de Meditação e Saúde Mental.
3.  **Titã do Sedentarismo:** Vencido por hábitos de Atividade Física.

---

## 3. Arquitetura de Dados (Modelagem MySQL)

### 3.1. Núcleo de Utilizador
* `Users`: Dados de conta e credenciais.
* `User_Stats`: Nível, XP, Moedas, Streaks atuais e recordes.

### 3.2. Núcleo de Hábitos e Humor
* `Habits`: Definição de hábitos (nome, tipo, dificuldade).
* `Mood_Entries`: Registos diários de humor (score 1-5).
* `Activity_Tags`: Dicionário de etiquetas (ex: "Família", "Stress").
* `Mood_Entry_Tags`: Tabela pivot para associar múltiplas tags a um registo de humor.

### 3.3. Núcleo de Gamificação
* `Bosses`: Definição dos monstros e suas fraquezas (tipos de hábitos).
* `Leagues`: Estrutura de grupos competitivos semanais.
* `Achievements`: Badges e conquistas especiais.

---

## 4. Roadmap de Desenvolvimento
- [ ] **Fase 1:** Documentação e Modelagem ER (MySQL Workbench).
- [ ] **Fase 2:** Configuração do Backend e Base de Dados.
- [ ] **Fase 3:** Implementação do MVP (Hábitos + Humor).
- [ ] **Fase 4:** Implementação da Gamificação (XP, Níveis e Bosses).
- [ ] **Fase 5:** Polimento Visual e Lançamento Beta.