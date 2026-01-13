# Fase 8 – Modelagem do Banco de Dados

## DDL Inicial do MVP do SIGCON

---

## 1. Objetivo da Fase 8

A **Fase 8** tem como objetivo **consolidar e documentar formalmente o modelo estrutural do banco de dados do MVP do SIGCON**, garantindo que:

* a estrutura do banco esteja **alinhada às regras de negócio já definidas** nas fases anteriores;
* exista **rastreabilidade técnica** entre requisitos, modelo lógico e scripts SQL;
* novos integrantes da equipe consigam **entender o que existe, por que existe e como evoluir** o banco de dados com segurança.

> **Importante:**
> Esta fase **não cria novos scripts executáveis**, mas **documenta e valida** os scripts já existentes e executados anteriormente.

---

## 2. Contexto do Projeto

O SIGCON é um sistema corporativo de apoio ao **Planejamento das Contratações (PCA)** e à **gestão das demandas (DFD)**, sujeito a:

* regras legais (Lei 14.133/2021, Lei 13.303/2016);
* normas de governança (Decreto 10.947/2022, Resolução CGPAR nº 45/2022);
* auditorias internas e externas.

Por esse motivo, o banco de dados deve obedecer aos princípios de:

* integridade referencial;
* rastreabilidade;
* versionamento controlado;
* previsibilidade de evolução.

---

## 3. Estrutura atual do projeto (Banco de Dados)

Atualmente, o projeto possui a seguinte organização relacionada ao banco de dados:

```
database/
├── ddl/
│   ├── 001_schema.sql
│   ├── 002_tabelas.sql
│   ├── 003_constraints.sql
│   ├── 004_indices.sql
│   ├── 005_views.sql
│   ├── 006_funcoes.sql
│   └── 007_triggers.sql
├── seeds/

```

Esses arquivos foram **executados na Fase 3 – Banco de Dados**, em ordem sequencial.

---

## 4. O que a Fase 8 define (e o que ela NÃO define)

### 4.1 O que a Fase 8 define

A Fase 8 estabelece que:

* os arquivos SQL acima representam o **DDL oficial do MVP**;
* eles constituem a **versão inicial do esquema do banco**;
* qualquer evolução futura deve ocorrer **por novos scripts**, nunca alterando os já aplicados.

Em outras palavras:

> **O banco já está criado.
> A Fase 8 documenta e congela essa estrutura como base oficial do projeto.**

---

### 4.2 O que a Fase 8 NÃO faz

Esta fase **não**:

* reaplica scripts no banco;
* recria tabelas;
* altera estruturas já executadas;
* insere dados funcionais ou de produção.

Essas ações ocorreram **legitimamente na Fase 3**.

---

## 5. Papel de cada arquivo SQL

Esta seção é fundamental para novos integrantes.

### 5.1 `001_schema.sql`

**Responsabilidade:**

* criação de schemas do banco (ex.: `sigcon`).

**Execução:**

* Executado **uma única vez** na criação inicial do banco (Fase 3).

**Regra:**

* Nunca deve ser reaplicado em banco já existente.

---

### 5.2 `002_tabelas.sql`

**Responsabilidade:**

* criação das tabelas do MVP:

  * usuários;
  * unidades;
  * DFD;
  * PCA;
  * tabelas auxiliares.

**Execução:**

* Executado na Fase 3, após o schema.

---

### 5.3 `003_constraints.sql`

**Responsabilidade:**

* chaves primárias;
* chaves estrangeiras;
* regras de integridade.

**Execução:**

* Executado após a criação das tabelas.

---

### 5.4 `004_indices.sql`

**Responsabilidade:**

* índices de performance;
* apoio a consultas frequentes.

---

### 5.5 `005_views.sql`

**Responsabilidade:**

* visões de apoio a relatórios e consultas consolidadas;
* abstração de consultas complexas.

---

### 5.6 `006_funcoes.sql`

**Responsabilidade:**

* funções SQL reutilizáveis;
* regras encapsuladas no banco.

---

### 5.7 `007_triggers.sql`

**Responsabilidade:**

* auditoria;
* controle automático de status;
* integridade comportamental.

---

## 6. Quando executar (ou NÃO executar) esses scripts

### 6.1 Ambiente já existente (situação atual)

| Ação                            | Deve executar? |
| ------------------------------- | -------------- |
| Reexecutar `001_schema.sql`     | ❌ Não          |
| Reexecutar `002_tabelas.sql`    | ❌ Não          |
| Alterar scripts já executados   | ❌ Não          |
| Criar novos scripts versionados | ✅ Sim          |

---

### 6.2 Novo ambiente (ex.: nova máquina ou novo integrante)

Somente em **um banco vazio**, o fluxo correto é:

1. Criar o banco PostgreSQL
2. Executar os scripts **em ordem numérica**:

```bash
psql -d sigcon -f 001_schema.sql
psql -d sigcon -f 002_tabelas.sql
psql -d sigcon -f 003_constraints.sql
psql -d sigcon -f 004_indices.sql
psql -d sigcon -f 005_views.sql
psql -d sigcon -f 006_funcoes.sql
psql -d sigcon -f 007_triggers.sql
```

> **Nunca executar scripts fora de ordem.**

---

## 7. Regra de ouro para evolução do banco

A partir da Fase 8, fica instituída a seguinte regra no SIGCON:

> **Scripts já executados NÃO são alterados.
> Toda mudança gera um novo script versionado.**

Exemplo futuro:

```
database/ddl/
├── 008_add_coluna_status_dfd.sql
├── 009_nova_view_relatorio_pca.sql
```

Isso garante:

* histórico técnico;
* rastreabilidade;
* segurança para manutenção.

---

## 8. Relação da Fase 8 com as próximas fases

A Fase 8 habilita diretamente:

* **Fase 9 – Versionamento formal do banco**
* **Fase 10 – Seeds controlados (status, papéis, permissões)**
* **Desenvolvimento do backend com segurança estrutural**

---

## 9. Conclusão

A **Fase 8 não cria código novo**, mas **formaliza o que já foi feito**, garantindo que:

* o banco do SIGCON tenha uma base sólida;
* qualquer novo desenvolvedor saiba exatamente:

  * o que já foi executado;
  * quando executar algo novo;
  * quando NÃO executar nada.

Este documento deve ser mantido no diretório:

```
docs/
└── arquitetura/
    └── fase-08-modelagem-banco.md
```
