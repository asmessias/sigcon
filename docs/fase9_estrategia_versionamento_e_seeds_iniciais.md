# Fase 9 – Estratégia de Versionamento e Seeds Iniciais

## 1. Objetivo da Fase

Definir, de forma clara e padronizada:

* a estratégia de versionamento do banco de dados;
* a política de versionamento do código-fonte;
* o uso e a organização de migrations;
* a criação e manutenção de seeds iniciais (dados estruturantes);
* o fluxo operacional para execução dessas rotinas em ambientes de desenvolvimento, homologação e produção.

Esta fase garante reprodutibilidade, rastreabilidade e segurança evolutiva do SIGCON.

---

## 2. Princípios Adotados

A estratégia desta fase está baseada nos seguintes princípios:

1. Banco de dados versionado como código;
2. Ambientes reproduzíveis do zero;
3. Separação clara entre estrutura (DDL) e dados estruturantes (Seeds);
4. Rastreabilidade temporal das alterações;
5. Compatibilidade com o ciclo anual do PCA.

---

## 3. Estratégia de Versionamento do Banco de Dados

### 3.1 Abordagem Geral

O SIGCON adota uma estratégia migration-based. Mesmo que, no MVP, as migrations sejam executadas manualmente via scripts SQL, todos os artefatos estruturais do banco devem estar versionados no repositório.

Cada alteração estrutural no banco de dados deve ser:

* incremental;
* registrada cronologicamente;
* não destrutiva sempre que possível;
* reversível por meio de nova migration, e nunca por edição de scripts já aplicados.

---

### 3.2 Estrutura de Diretórios

```text
database/
 ├── migrations/
 │   ├── V001__estrutura_inicial.sql
 │   ├── V002__tabelas_dominio.sql
 │   ├── V003__regras_integridade.sql
 │   ├── V004__ajustes_fluxo_demanda.sql
 │   └── ...
 ├── seeds/
 │   ├── S001__status_demanda.sql
 │   ├── S002__perfis_acesso.sql
 │   ├── S003__tipos_documento.sql
 │   ├── S004__parametros_sistema.sql
 │   └── ...
 └── README.md
```

---

### 3.3 Convenção de Versionamento – Migrations

**Padrão:**

```
V{NNN}__descricao_curta.sql
```

**Exemplos:**

* V001__estrutura_inicial.sql
* V005__inclusao_coluna_prioridade.sql

**Regras:**

* migrations nunca devem ser alteradas após execução em qualquer ambiente;
* correções estruturais devem gerar uma nova migration;
* a numeração é sequencial, incremental e obrigatória;
* migrations representam exclusivamente mudanças estruturais (DDL).

---

## 4. Estratégia de Seeds Iniciais

### 4.1 Conceito

Seeds iniciais são dados estruturantes e obrigatórios para o funcionamento do SIGCON, independentes de dados operacionais e transacionais.

Esses dados refletem regras normativas, estados do fluxo, classificações fixas e parâmetros institucionais.

---

### 4.2 Tipos de Seeds no SIGCON

#### 4.2.1 Seeds Normativos

Dados derivados diretamente da legislação, decretos e manuais que fundamentam o PCA e o PGC.

Exemplos:

* status do fluxo da demanda;
* graus de prioridade (baixa, média, alta);
* tipos de contratação;
* tipos de documentos (DFD, ETP, TR, etc.).

---

#### 4.2.2 Seeds de Governança

Dados relacionados ao modelo de controle de acesso e segregação de funções.

Exemplos:

* perfis de acesso;
* papéis institucionais;
* permissões padrão por perfil.

Esses seeds refletem diretamente o modelo definido na Fase 6 – Regras e Permissões.

---

#### 4.2.3 Seeds de Parâmetros do Sistema

Dados configuráveis que orientam o comportamento do sistema, sem caráter transacional.

Exemplos:

* ano base do PCA;
* datas de corte do ciclo anual;
* parâmetros de configuração do sistema;
* flags para funcionalidades futuras.

---

### 4.3 Convenção de Versionamento – Seeds

**Padrão:**

```
S{NNN}__descricao_curta.sql
```

**Exemplos:**

* S001__status_demanda.sql
* S002__perfis_acesso.sql

**Regras:**

* seeds podem ser reexecutáveis;
* utilizar, sempre que possível, cláusulas de proteção como `WHERE NOT EXISTS` ou `ON CONFLICT`;
* seeds não devem conter dados transacionais;
* cada seed deve tratar um único conjunto lógico de dados.

---

## 5. Ordem de Execução Recomendada

### 5.1 Ambiente Novo

1. Criar o banco de dados;
2. Executar todas as migrations, em ordem numérica;
3. Executar todos os seeds;
4. Validar integridade referencial;
5. Liberar o ambiente para uso.

---

### 5.2 Ambiente Existente

1. Executar apenas novas migrations;
2. Executar novos seeds, quando aplicável;
3. Validar impactos nas regras de negócio e no fluxo do sistema.

---

## 6. Estratégia de Versionamento do Código-Fonte

### 6.1 Versionamento Semântico (SemVer)

O SIGCON adota versionamento semântico no formato:

```
MAJOR.MINOR.PATCH
```

* MAJOR: mudanças incompatíveis;
* MINOR: novas funcionalidades compatíveis;
* PATCH: correções.

**Exemplos:**

* 0.1.0 – MVP inicial;
* 0.2.0 – Evolução funcional;
* 0.2.1 – Correção de regra.

---

### 6.2 Alinhamento Código x Banco de Dados

Cada versão do sistema deve declarar explicitamente:

* a versão mínima do banco de dados suportada;
* o conjunto de migrations esperadas como aplicadas;
* eventuais dependências entre código e estrutura de dados.

---

## 7. Rastreabilidade e Auditoria

Todos os scripts de migration e seed devem conter cabeçalho padrão:

```sql
-- Projeto: SIGCON
-- Fase: 9 - Estratégia de Versionamento e Seeds
-- Autor: <nome>
-- Data: YYYY-MM-DD
-- Descrição: <descrição objetiva da alteração>
```

Esse padrão assegura rastreabilidade histórica, auditoria técnica e facilidade de manutenção.

---

## 8. Resultado Esperado da Fase 9

Ao final desta fase, o SIGCON passa a possuir:

* banco de dados completamente versionado;
* dados estruturantes padronizados e rastreáveis;
* ambientes reproduzíveis do zero;
* base técnica sólida para evolução contínua;
* aderência normativa e governança comprováveis.
