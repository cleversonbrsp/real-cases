
### RUNDECK

# Introdução

O que é o Rundeck?
O Rundeck é uma plataforma de automação de operações que permite agendar e executar tarefas em sistemas distribuídos.

O que resolve?
Ele resolve o desafio de automatizar processos operacionais repetitivos e complexos, simplificando a execução e o gerenciamento de tarefas em ambientes distribuídos.

Para quem é destinado?
O Rundeck é destinado a equipes de operações e DevOps que lidam com a administração de sistemas distribuídos e buscam automatizar tarefas operacionais para melhorar a eficiência e reduzir erros.

Quais são os recursos principais?
Os recursos principais do Rundeck incluem agendamento de tarefas, execução remota de comandos, fluxos de trabalho de automação, controle de acesso baseado em papéis e registro de atividades.

Quais são os benefícios?
Os benefícios do Rundeck incluem redução de tempo gasto em tarefas operacionais, minimização de erros humanos, padronização de processos, melhoria da escalabilidade e maior visibilidade das operações.

Como funciona?
O Rundeck funciona fornecendo uma interface intuitiva para criar e agendar tarefas operacionais, que podem ser executadas em sistemas distribuídos, com controle granular de acesso e registro de atividades.

Quais são os requisitos de sistema?
Os requisitos de sistema do Rundeck são geralmente modestos, exigindo recursos como CPU, RAM e armazenamento suficientes para suportar o número e a complexidade das tarefas a serem executadas.

Existe suporte e documentação disponíveis?
Sim, o Rundeck oferece suporte técnico, documentação detalhada e uma comunidade ativa para ajudar os usuários a implementar e utilizar a plataforma de forma eficaz.

![externalsecret](./imgs/img2.jpg)

### Observações:
Para adicionar um PostgreSQL e interconectar com o Rundeck, precisamos criar o Deployment e Service do PostgreSQL, adicionar um Secret para armazenar as credenciais do banco de dados e atualizar o Deployment do Rundeck para usar o PostgreSQL.

Aqui foi criado um Deployment para PostgreSQL usando a imagem Bitnami PostgreSQL, com as credenciais armazenadas em um ExternalSecret.
Associado a isso, foi criado também um Service para expor PostgreSQL no cluster.

Em seguida, é atualizado o Deployment do Rundeck para usar o PostgreSQL como seu banco de dados, pegando as credenciais do Secret.

Por fim, é realizado o setup para os Persistent Volume Claims onde é definido PVCs para armazenar dados de Rundeck e PostgreSQL.

### fontes de setup
https://docs.rundeck.com/docs/administration/configuration/docker.html#basic
