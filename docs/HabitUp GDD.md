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

### 🎮 Mecânicas de Jogo e Progressão
## ⚔️ Sistema de Combate e Recompensas
A progressão do jogador é ditada pela conclusão de hábitos, que geram experiência (XP) e causam dano ao Boss ativo.

| Dificuldade | XP | Dano | Descrição da Tarefa |
| :--- | :---: | :---: | :--- |
| Fácil | 10 XP | 10 HP | Ações rápidas (ex: beber água, arrumar a cama) |
| Médio | 25 XP | 25 HP | Exige esforço moderado (ex: 15 min de leitura) |
| Difícil | 50 XP | 50 HP | Grande empenho (ex: treino na academia, 2h de estudo) |

## 💡 Multiplicador de Fraqueza:
 Se o type do hábito coincidir com o type_weakness do Boss, o dano é multiplicado por 1.5x.

## 🆙 Curva de Nível
O jogador sobe de nível ao atingir a meta de XP, que escala linearmente para manter o desafio equilibrado:

- Cálculo:
  $$XP_{Necessário} = Nível_{Atual} \times 100$$
  
 - Exemplos:

- Nível 1 → 2: 100 XP 
- Nível 2 → 3: 200 XP
 - Nível 5 → 6: 500 XP

## 🔥 Sistema de Combo (Streak)
Manter a consistência gera bônus passivos no ganho de XP:
 
 - 3 dias: +5% XP

- 7 dias: +10% XP

- 15+ dias: +20% XP (Bônus Máximo)


---

## 4. Roadmap de Desenvolvimento
- [X] **Fase 1:** Documentação e Modelagem ER (MySQL Workbench).
- [ ] **Fase 2:** Configuração do Backend e Base de Dados.
- [ ] **Fase 3:** Implementação do MVP (Hábitos + Humor).
- [ ] **Fase 4:** Implementação da Gamificação (XP, Níveis e Bosses).
- [ ] **Fase 5:** Polimento Visual e Lançamento Beta.