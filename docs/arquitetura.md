# Arquitetura do SIGCON

## 1. Visão Geral

O SIGCON – Sistema Integrado de Gestão de Contratações – é uma plataforma corporativa
voltada à governança do ciclo completo das contratações públicas, com foco inicial no
Planejamento das Contratações (PCA), evoluindo para o planejamento de contratações
específicas e gestão contratual.

O sistema será desenvolvido inicialmente com base no contexto regulatório da Conab,
observando a Lei nº 13.303/2016, o Regulamento de Licitações e Contratos (RLC) da Conab
e a Resolução CGPAR nº 45/2022, mantendo flexibilidade para adaptação a outras
empresas estatais.

## 2. Arquitetura Geral

A arquitetura adotada é baseada em separação clara de responsabilidades, composta por:

- Frontend: Angular
- Backend: PHP (Laravel)
- Banco de Dados: PostgreSQL
- Autenticação: LDAP/AD (usuários internos) e autenticação local (fornecedores)
- Infraestrutura: Docker e Docker Compose
- Versionamento: Git
- Ambiente de desenvolvimento: WSL2 + VS Code

## 3. Organização em Camadas

### 3.1 Frontend
- Aplicação SPA (Single Page Application)
- Comunicação exclusiva via API REST
- Controle de acesso baseado em perfis
- Interfaces orientadas ao fluxo de negócios (PCA, planejamento, contratos)

### 3.2 Backend
- API RESTful
- Camadas bem definidas:
  - Controllers
  - Services (regras de negócio)
  - Repositories (acesso a dados)
  - Models
- Validações centralizadas
- Registro de logs para auditoria

### 3.3 Banco de Dados
- Modelo relacional
- Versionamento de esquema via migrations
- Histórico de alterações críticas (auditoria)

## 4. Princípios Arquiteturais

- Modularidade
- Aderência normativa
- Auditabilidade
- Rastreabilidade das decisões
- Evolução incremental (vibe coding controlado)
- Baixo acoplamento e alta coesão

## 5. Evolução Prevista

- Inclusão de novos módulos sem impacto estrutural
- Parametrização por ente estatal
- Integração com sistemas corporativos existentes
