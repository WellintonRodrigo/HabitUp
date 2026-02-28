Documentação do Banco de Dados - HabitUp
Esta documentação descreve a estrutura relacional do HabitUp, um sistema de gamificação de hábitos integrado ao monitoramento de bem-estar emocional.

📌 Visão Geral
O banco de dados utiliza o motor InnoDB (MySQL) para garantir suporte a transações e integridade referencial através de chaves estrangeiras (FKs). A lógica central baseia-se na progressão de usuário via experiência (XP) e combate a "Bosses" através da conclusão de tarefas.

🏗️ Estrutura das Tabelas
1. users (Usuários)
Armazena o perfil, autenticação e progresso do jogador.

id: INT (PK) - Identificador único.

username: VARCHAR(45) (Unique) - Nome de exibição.

level: INT - Nível atual do personagem.

total_xp: INT - Experiência acumulada.

current_streak: INT - Contador de dias consecutivos ativos.

active_boss_id: INT (FK) - Referência ao Boss que o usuário está enfrentando.

2. habits (Hábitos)
Configurações das tarefas recorrentes criadas pelo usuário.

type: ENUM('físico', 'mental', 'produtividade') - Categoria do hábito.

difficulty: ENUM('facil', 'medio', 'dificil') - Determina o ganho de XP e dano no Boss.

frequency_type: ENUM('diario', 'semanal', 'mensal') - Ciclo de renovação da tarefa.

3. habit_logs (Histórico de Execução)
Registra cada vez que um hábito é concluído.

log_date: DATE - Data da conclusão.

xp_earned: INT - Valor fixo de XP ganho naquela instância.

Regra de Unicidade: Existe uma restrição única (habits_id + log_date) para impedir que o mesmo hábito seja contabilizado mais de uma vez no mesmo dia.

4. mood_entries (Registros de Humor)
Rastreamento diário do estado emocional.

mood_score: TINYINT - Escala de 1 a 5.

note: TEXT - Observações opcionais do usuário sobre o seu dia.

5. bosses (Inimigos/Desafios)
Entidades do jogo que o usuário derrota ao completar hábitos.

max_hp / current_hp: INT - Pontos de vida do Boss.

type_weakness: ENUM - Categoria de hábito que causa dano crítico a este Boss específico.

🛡️ Integridade e Manutenção de Dados
Para garantir a consistência do ecossistema HabitUp, as seguintes regras de deleção e atualização foram aplicadas:

Cascata de Atualização (ON UPDATE CASCADE): Presente em todas as relações. Se um ID de usuário ou hábito for alterado, todos os logs e registros vinculados são atualizados automaticamente.

Cascata de Deleção (ON DELETE CASCADE): Se um usuário deletar sua conta ou um hábito específico, todos os dados históricos diretamente vinculados a eles são removidos para evitar lixo eletrônico no banco.

Preservação de Logs (ON DELETE SET NULL): Se um registro de humor em mood_entries for apagado, o log do hábito em habit_logs é preservado, apenas perdendo a referência ao humor daquele momento. Isso garante que o XP do usuário não diminua retroativamente.

🚀 Como Implementar
O script SQL de criação (schema.sql) e o de dados iniciais (seed.sql) estão disponíveis na pasta de scripts deste repositório.