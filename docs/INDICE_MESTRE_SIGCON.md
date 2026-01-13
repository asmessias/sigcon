# SIGCON – Índice Mestre da Documentação Técnica

## Visão Geral

Este documento consolida todas as fases da **documentação inicial do SIGCON**, servindo como **ponto único de referência** para desenvolvedores, arquitetos, analistas, auditores, gestores e novos integrantes da equipe.

A documentação foi estruturada por fases progressivas, cobrindo desde o entendimento do negócio até segurança, LGPD e auditoria avançada.

---

## Estrutura Geral da Documentação

### Fase 1 – Visão Geral e Contexto do Sistema
- Objetivos do SIGCON
- Contexto institucional e legal
- Escopo inicial do sistema
- Premissas e restrições
- Público-alvo

---

### Fase 2 – Levantamento de Requisitos
- Requisitos funcionais
- Requisitos não funcionais
- Requisitos legais e normativos
- Restrições técnicas
- Critérios de sucesso

---

### Fase 3 – Banco de Dados
- Modelo conceitual
- Modelo lógico
- Modelagem relacional
- Dicionário de dados
- Scripts DDL
- Estratégia de versionamento do banco
- Orientações de execução e manutenção

---

### Fase 4 – Fluxos de Negócio
- Fluxo de DFD (Documento de Formalização de Demanda)
- Fluxo de PCA (Plano de Contratações Anual)
- Papéis e responsabilidades
- Pontos de controle e decisão
- Estados e transições

---

### Fase 5 – Casos de Uso
- Casos de uso por perfil
- Descrição detalhada dos fluxos
- Regras associadas
- Exceções e fluxos alternativos

---

### Fase 6 – Regras de Negócio e Permissões
- Modelo de perfis
- Permissões granulares
- Segregação de funções
- Restrições legais e operacionais
- Matriz de permissões

---

### Fase 7 – Modelagem Técnica do Sistema (MVP)
- Arquitetura geral (PHP + Angular)
- Organização de camadas
- APIs e contratos
- Padrões técnicos adotados
- Escopo do MVP

---

### Fase 8 – Modelagem DDL e Scripts Técnicos
- Estrutura física do banco
- Scripts SQL versionados
- Ordem de execução
- Estratégia de migração
- Boas práticas para manutenção evolutiva

---

### Fase 9 – Integrações e Interfaces Externas
- Integração com PGC
- Exportações e relatórios
- Interfaces previstas
- Estratégia de evolução das integrações

---

### Fase 10 – Checklist Operacional de Ambientes
- Ambiente de desenvolvimento
- Ambiente de homologação
- Ambiente de produção
- Variáveis de ambiente
- Dependências
- Procedimentos de validação

---

### Fase 11 – Estratégia de Homologação e Aceite
- Tipos de testes
- Critérios de homologação
- Papéis envolvidos
- Evidências de aceite
- Procedimentos de aprovação

---

### Fase 12 – Estratégia de Operação e Suporte
- Operação diária do sistema
- Gestão de incidentes
- Suporte ao usuário
- Procedimentos de contingência
- Continuidade do serviço

---

### Fase 13 – Estratégia de Evolução e Manutenção
- Governança de mudanças
- Versionamento
- Gestão de backlog
- Evolução normativa
- Sustentabilidade do sistema

---

### Fase 14 – Indicadores, Métricas e Auditoria
- Indicadores operacionais
- Indicadores de governança
- Métricas de desempenho
- Suporte à auditoria
- Monitoramento contínuo

---

### Fase 15 – Segurança, LGPD e Trilhas de Auditoria Avançadas
- Segurança da informação
- Controle de acesso
- Proteção de dados pessoais (LGPD)
- Trilhas de auditoria imutáveis
- Evidências digitais
- Conformidade legal e regulatória

---

## Organização Recomendada no Repositório

```text
/docs
 ├── FASE_01_VISAO_GERAL.md
 ├── FASE_02_REQUISITOS.md
 ├── FASE_03_BANCO_DADOS.md
 ├── FASE_04_FLUXOS_NEGOCIO.md
 ├── FASE_05_CASOS_USO.md
 ├── FASE_06_REGRAS_PERMISSOES.md
 ├── FASE_07_MODELAGEM_TECNICA_MVP.md
 ├── FASE_08_MODELAGEM_DDL.md
 ├── FASE_09_INTEGRACOES.md
 ├── FASE_10_CHECKLIST_OPERACIONAL.md
 ├── FASE_11_HOMOLOGACAO_ACEITE.md
 ├── FASE_12_OPERACAO_SUPORTE.md
 ├── FASE_13_EVOLUCAO_MANUTENCAO.md
 ├── FASE_14_INDICADORES_AUDITORIA.md
 └── FASE_15_SEGURANCA_LGPD_AUDITORIA.md
