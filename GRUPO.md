---
integrante1: Carolina Almeida Ferreira Vilela 202412901002
integrante2: Eduardo Braga de Oliveira 202221901008
integrante3: Lucas Henriques de Carvalho 202221901065
integrante4: Teo Mattos Pereira da Silva 202221901045
--- 

Plataforma de Cursos Online

# PROBLEMA
O projeto visa desenvolver o banco de dados para uma plataforma de ensino a distância (EAD). A necessidade surge da crescente demanda por aprendizado online, que exige um sistema robusto para gerenciar múltiplos atores e processos. A plataforma deve permitir que instrutores criem e disponibilizem cursos, e que alunos possam se inscrever, consumir o conteúdo e avaliar os cursos.

O sistema precisa de uma estrutura de dados que suporte perfis de usuários distintos (alunos e instrutores), um catálogo de cursos organizados por categorias, aulas sequenciais e um sistema de assinaturas com diferentes planos de acesso. Além disso, é fundamental gerenciar o ciclo de vida das matrículas, o progresso dos alunos e o feedback através de avaliações, garantindo a integridade e a consistência dos dados em todas as interações.

# PRINCIPAIS REQUISITOS DO SISTEMA
Para atender ao contexto descrito, o banco de dados foi projetado para tratar das seguintes restrições e funcionalidades:

1. Gestão de Usuários

- O sistema deve permitir o cadastro de usuários, armazenando informações essenciais como nome, email, senha e CPF, garantindo que emails e CPFs sejam únicos.

- Um usuário pode assumir o papel de aluno, instrutor ou ambos.

- Deve ser possível controlar o status da conta de um usuário (ativo ou inativo).

2. Catálogo de Cursos e Aulas
- A plataforma deve suportar o cadastro de múltiplos cursos, cada um com título, descrição e associado a uma categoria específica (ex: Programação, Design, Negócios).

- Cada curso deve ser gerenciado por um instrutor responsável.

- Os cursos são compostos por aulas, que devem ter uma ordem definida, título, conteúdo e duração.

3. Inscrições e Avaliações
- Alunos devem poder se inscrever nos cursos, e o sistema deve registrar a data de inscrição e o status (ativa, concluida, cancelada).

- Após a inscrição, os alunos podem avaliar os cursos, fornecendo uma nota e um depoimento.

4. Sistema de Assinaturas e Pagamentos
- A plataforma funcionará com um modelo de assinaturas, oferecendo diferentes planos (silver, gold, diamond).

- O sistema deve ser capaz de processar pagamentos por diferentes métodos, incluindo cartao, boleto e pix.

- O sistema deve gerenciar as assinaturas ativas dos usuários, controlando a data de início, data de fim, o plano e o status (ativo, falta_pagamento).

- O registro de pagamentos é essencial, armazenando o valor, método, data e status (pendente, pago, falhou).

- Restrição de Negócio: Um gatilho (trigger) deve garantir que, sempre que um pagamento for atualizado para o status pago, a assinatura correspondente seja atualizada para ativo e o plano do usuário na tabela usuarios seja sincronizado com o plano da nova assinatura.

