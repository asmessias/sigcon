# FASE 11 – ESTRATÉGIA DE HOMOLOGAÇÃO E ACEITE

## 1. Objetivo da Fase 11

Definir, de forma **estruturada, rastreável e auditável**, a estratégia de **homologação, validação e aceite** do sistema SIGCON, assegurando que:

* o MVP entregue esteja **aderente aos requisitos funcionais e não funcionais** definidos nas fases anteriores;
* o sistema reflita **fielmente os fluxos legais e normativos do PCA/PGC**;
* haja **segurança jurídica, operacional e institucional** para entrada em produção;
* os critérios de aceite estejam claros para **usuários, área demandante e governança**.

---

## 2. Princípios Norteadores da Homologação

A estratégia de homologação do SIGCON é orientada pelos seguintes princípios:

1. **Conformidade normativa**

   * Aderência integral à legislação e normativos que regem o PCA, DFD e governança das contratações.

2. **Fidelidade ao processo real**

   * O sistema deve reproduzir o processo administrativo real, e não apenas um fluxo tecnológico.

3. **Segregação de responsabilidades**

   * Homologação técnica ≠ homologação funcional ≠ aceite institucional.

4. **Rastreabilidade**

   * Toda decisão de aceite deve estar documentada, versionada e justificável.

5. **Escalonamento progressivo**

   * Homologação por camadas: técnica → funcional → institucional.

---

## 3. Escopo da Homologação no MVP

A homologação do MVP do SIGCON **não cobre todo o ciclo de vida da contratação**, mas **exatamente o que foi definido como MVP nas fases anteriores**, incluindo:

### 3.1 Funcionalidades abrangidas

* Cadastro e gestão de:

  * áreas requisitantes;
  * usuários e perfis;
  * Documentos de Formalização de Demanda (DFD);
* Fluxo de estados da demanda:

  * elaboração;
  * análise;
  * devolução;
  * aprovação;
* Consolidação das demandas no PCA;
* Aprovação institucional do PCA;
* Registro de justificativas, devoluções e reprovações;
* Trilhas de auditoria (quem fez, quando e por quê).

### 3.2 Funcionalidades fora do escopo de homologação do MVP

* Execução contratual;
* Gestão de contratos;
* Integrações externas (PNCP, Compras.gov, SIAFI);
* BI avançado e relatórios gerenciais estratégicos.

---

## 4. Tipos de Homologação

### 4.1 Homologação Técnica

**Responsável:** equipe técnica (desenvolvedor/arquiteto)

**Objetivo:** garantir que o sistema:

* esteja estável;
* não possua erros críticos;
* respeite a modelagem de dados definida;
* implemente corretamente regras de negócio já documentadas.

**Abrange:**

* validação de migrations e seeds;
* integridade referencial;
* permissões e controles de acesso;
* transições válidas de status;
* consistência de dados entre telas.

---

### 4.2 Homologação Funcional

**Responsável:** usuário-chave / especialista do processo (perfil Gepac / planejamento)

**Objetivo:** validar que o sistema:

* representa corretamente o processo de PCA;
* reflete a realidade administrativa;
* é utilizável no dia a dia.

**Abrange:**

* criação de DFDs reais ou simulados;
* verificação das regras de prioridade;
* testes de devolução, correção e reapreciação;
* consolidação de demandas;
* aprovação do PCA.

---

### 4.3 Homologação Institucional

**Responsável:** instância de governança definida (ex.: autoridade competente ou patrocinador do projeto)

**Objetivo:** declarar formalmente que o sistema:

* está apto a apoiar o processo institucional;
* pode ser adotado como ferramenta oficial;
* atende aos requisitos mínimos de governança.

**Resultado esperado:**

* aceite formal do MVP;
* autorização para implantação controlada (piloto ou produção assistida).

---

## 5. Critérios de Aceite do Sistema

O SIGCON será considerado **homologado e aceito** quando TODOS os critérios abaixo forem atendidos.

### 5.1 Critérios Técnicos

* [ ] Sistema executa sem erros críticos;
* [ ] Base de dados íntegra e versionada;
* [ ] Perfis e permissões funcionando conforme Fase 6;
* [ ] Fluxos de status respeitam as regras definidas;
* [ ] Logs e trilhas de auditoria operacionais.

---

### 5.2 Critérios Funcionais

* [ ] DFD pode ser criado, editado, enviado e devolvido;
* [ ] Justificativas são obrigatórias quando exigidas;
* [ ] PCA consolida corretamente as demandas;
* [ ] Aprovação e reprovação do PCA funcionam corretamente;
* [ ] Usuários reconhecem o fluxo como aderente à prática real.

---

### 5.3 Critérios Institucionais

* [ ] Sistema atende ao objetivo do MVP;
* [ ] Não há riscos jurídicos evidentes no uso;
* [ ] Existe clareza sobre limitações do MVP;
* [ ] Há concordância formal quanto à entrada em operação.

---

## 6. Evidências de Homologação

Para cada etapa da homologação, devem ser geradas **evidências mínimas**, tais como:

* checklists preenchidos;
* registros de testes executados;
* prints ou logs relevantes;
* ata simples de aceite funcional;
* termo de aceite do MVP (modelo simplificado).

Essas evidências **integram a documentação do projeto** e servem como base para auditorias futuras.

---

## 7. Resultado Esperado da Fase 11

Ao final da Fase 11, o projeto SIGCON terá:

* um **MVP formalmente homologado**;
* critérios claros de aceite;
* segurança técnica, funcional e institucional;
* autorização para seguir para:

  * implantação assistida, ou
  * evolução funcional controlada.

---

## 8. Encerramento da Fase

A Fase 11 é considerada **concluída** quando:

* todos os critérios de aceite forem atendidos;
* o aceite institucional for formalizado;
* o sistema estiver apto a entrar em uso conforme estratégia definida.

---
