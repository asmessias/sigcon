# Fase 3.3.1 – Definição dos Status da Demanda

Esta etapa define o **conjunto oficial de status** que uma demanda pode assumir ao longo do seu ciclo de vida no SIGCON, com foco em:

* Governança do PCA
* Clareza de responsabilidades
* Implementação direta no workflow do sistema
* Auditoria e transparência

Os status estão organizados por **macroetapas**, refletindo a lógica do planejamento das contratações.

---

## Visão Geral do Ciclo de Status

```
Rascunho
  ↓
Submetida
  ↓
Em Análise Técnica
  ↓
Consolidada no PCA
  ↓
Aprovada no PCA
  ↓
(Planejamento da Contratação | Não Executada | Cancelada | Reprogramada)
  ↓
Encerrada
```

---

## 1. Status da Fase de Identificação da Demanda

### 1.1 Rascunho

**Descrição:**
Demanda em elaboração pela unidade requisitante, ainda não formalmente enviada.

**Características:**

* Pode ser editada livremente
* Não integra o PCA
* Não gera efeitos administrativos

**Responsável:**
Área requisitante

**Eventos de saída:**

* Envio formal da demanda

---

### 1.2 Submetida

**Descrição:**
Demanda formalmente enviada pela unidade requisitante para análise.

**Características:**

* Conteúdo bloqueado para edição pela unidade requisitante
* Passível de devolução para ajustes

**Responsável:**
Área requisitante (envio)
Área de planejamento (recebimento)

**Eventos de saída:**

* Aceite para análise
* Devolução para ajustes

---

## 2. Status da Fase de Análise e Consolidação

### 2.1 Em Análise Técnica

**Descrição:**
Demanda sob avaliação técnica, administrativa e estratégica.

**Atividades típicas:**

* Avaliação da justificativa
* Verificação de aderência ao planejamento estratégico
* Análise preliminar de viabilidade orçamentária
* Identificação de similaridade com outras demandas

**Responsável:**
Área de planejamento das contratações (GEPAC)

**Eventos de saída:**

* Consolidação no PCA
* Indeferimento fundamentado
* Devolução para ajustes

---

### 2.2 Devolvida para Ajustes

**Descrição:**
Demanda retornada à unidade requisitante para correção ou complementação.

**Características:**

* Deve conter despacho motivado
* Histórico da devolução deve ser preservado

**Responsável:**
Área de planejamento → Área requisitante

**Eventos de saída:**

* Reenvio da demanda
* Cancelamento pelo requisitante

---

### 2.3 Consolidada no PCA

**Descrição:**
Demanda validada e incorporada à proposta consolidada do PCA.

**Características:**

* Pode sofrer ajustes de escopo, prazo ou agrupamento
* Passa a integrar a minuta do PCA

**Responsável:**
Área de planejamento das contratações

**Eventos de saída:**

* Aprovação do PCA
* Exclusão fundamentada antes da aprovação

---

## 3. Status da Fase de Aprovação do PCA

### 3.1 Aprovada no PCA

**Descrição:**
Demanda integrante de PCA formalmente aprovado pela autoridade competente.

**Características:**

* Deve ser publicada junto ao PCA
* Ganha caráter de planejamento institucional

**Responsável:**
Autoridade competente / instância deliberativa

**Eventos de saída:**

* Início do planejamento da contratação
* Decisão de não execução no exercício

---

### 3.2 Reprovada no PCA

**Descrição:**
Demanda não aprovada no processo decisório do PCA.

**Características:**

* Deve conter justificativa formal
* Não pode ser executada no exercício

**Responsável:**
Autoridade competente

**Eventos de saída:**

* Encerramento do ciclo
* Reavaliação em ciclo futuro

---

## 4. Status da Fase de Execução (ou Não Execução)

### 4.1 Em Planejamento da Contratação

**Descrição:**
Demanda que originou processo administrativo de contratação.

**Características:**

* Vinculação com DOD, ETP, TR/PB
* Integração com módulo de planejamento da contratação

**Responsável:**
Área demandante / área técnica

**Eventos de saída:**

* Início do processo licitatório
* Cancelamento justificado

---

### 4.2 Em Processo Licitatório

**Descrição:**
Demanda com procedimento licitatório ou contratação direta em andamento.

**Responsável:**
Área de contratações (SUCOT / unidade equivalente)

**Eventos de saída:**

* Contratação realizada
* Licitação fracassada ou deserta
* Revogação ou anulação

---

### 4.3 Contratada

**Descrição:**
Demanda com contrato formalizado.

**Características:**

* Deve manter vínculo com o contrato
* Permite acompanhamento de execução futura

**Responsável:**
Área gestora do contrato

**Eventos de saída:**

* Encerramento do ciclo de planejamento

---

### 4.4 Não Executada no Exercício

**Descrição:**
Demanda aprovada no PCA, mas não executada até o fim do exercício.

**Características:**

* Justificativa obrigatória
* Avaliação para reprogramação

**Base normativa:**
Art. 10 da CGPAR 45

**Eventos de saída:**

* Reprogramação para exercício seguinte
* Encerramento definitivo

---

## 5. Status de Ajuste e Encerramento

### 5.1 Reprogramada para Exercício Seguinte

**Descrição:**
Demanda não executada, mas considerada ainda necessária.

**Características:**

* Deve manter justificativa válida
* Gera nova instância no PCA seguinte

**Responsável:**
Área de planejamento + autoridade competente

---

### 5.2 Cancelada

**Descrição:**
Demanda cancelada por perda de necessidade, oportunidade ou viabilidade.

**Características:**

* Cancelamento sempre motivado
* Histórico preservado para auditoria

---

### 5.3 Encerrada

**Descrição:**
Status final do ciclo da demanda.

**Motivos típicos:**

* Contratação concluída
* Cancelamento definitivo
* Reprogramação efetivada

---

## Observações Importantes para Implementação no SIGCON

* Cada transição de status deve gerar **registro de log** (data, usuário, justificativa).
* O sistema deve impedir **execução de demandas não aprovadas no PCA**.
* Demandas reprogramadas **não são a mesma instância**, mas devem manter vínculo histórico.
* Status devem ser **parametrizáveis**, mas com núcleo protegido.

---

# Fase 3.3.2 – Regras de Transição de Status da Demanda

Esta etapa define **como**, **quando** e **por quem** uma demanda pode mudar de status ao longo do seu ciclo de vida, estabelecendo:

* Transições permitidas e proibidas
* Papéis autorizadores
* Gatilhos manuais e automáticos
* Regras de exceção
* Controles obrigatórios (logs, justificativas e bloqueios)

---

## 1. Princípios Gerais das Transições

As transições de status no SIGCON obedecerão aos seguintes princípios estruturantes:

1. **Transição explícita**
   Nenhum status muda de forma implícita ou silenciosa.

2. **Autorização por perfil**
   Cada transição exige perfil compatível (requisitante, planejamento, autoridade).

3. **Justificativa obrigatória para exceções**
   Cancelamentos, reprovações, não execução e reprogramações exigem motivação formal.

4. **Irreversibilidade controlada**
   Alguns status são finais ou exigem reabertura formal do ciclo.

5. **Auditabilidade total**
   Todas as transições geram registro permanente.

---

## 2. Matriz de Transição de Status (Visão Lógica)

| Status Atual                         | Pode Transitar Para                  | Observações                         |
| ------------------------------------ | ------------------------------------ | ----------------------------------- |
| Rascunho                             | Submetida                            | Ação exclusiva da área requisitante |
| Submetida                            | Em Análise Técnica                   | Aceite da área de planejamento      |
| Submetida                            | Devolvida para Ajustes               | Com despacho motivado               |
| Em Análise Técnica                   | Consolidada no PCA                   | Validação positiva                  |
| Em Análise Técnica                   | Devolvida para Ajustes               | Ajustes técnicos                    |
| Em Análise Técnica                   | Cancelada                            | Indeferimento fundamentado          |
| Consolidada no PCA                   | Aprovada no PCA                      | Após deliberação                    |
| Consolidada no PCA                   | Reprovada no PCA                     | Decisão formal                      |
| Aprovada no PCA                      | Em Planejamento da Contratação       | Início da execução                  |
| Aprovada no PCA                      | Não Executada no Exercício           | Decisão posterior                   |
| Em Planejamento da Contratação       | Em Processo Licitatório              | Deflagração do certame              |
| Em Planejamento da Contratação       | Cancelada                            | Justificativa obrigatória           |
| Em Processo Licitatório              | Contratada                           | Contrato assinado                   |
| Em Processo Licitatório              | Cancelada                            | Revogação/anulação                  |
| Contratada                           | Encerrada                            | Encerramento do ciclo               |
| Não Executada no Exercício           | Reprogramada para Exercício Seguinte | Novo PCA                            |
| Não Executada no Exercício           | Encerrada                            | Perda de necessidade                |
| Reprogramada para Exercício Seguinte | Encerrada                            | Fechamento do ciclo original        |

---

## 3. Regras Detalhadas por Transição Crítica

### 3.1 Rascunho → Submetida

**Quem pode executar:**
Área requisitante

**Condições obrigatórias:**

* Campos mínimos preenchidos
* Justificativa válida
* Indicação de prioridade

**Gatilho:**
Manual

---

### 3.2 Submetida → Em Análise Técnica

**Quem pode executar:**
Área de planejamento (GEPAC)

**Condições obrigatórias:**

* Conferência de completude
* Registro do responsável pela análise

**Gatilho:**
Manual (aceite)

---

### 3.3 Em Análise Técnica → Consolidada no PCA

**Quem pode executar:**
Área de planejamento

**Condições obrigatórias:**

* Avaliação técnica favorável
* Aderência estratégica
* Compatibilidade preliminar com orçamento

**Gatilho:**
Manual
*(pode haver apoio de validações automáticas)*

---

### 3.4 Consolidada no PCA → Aprovada no PCA

**Quem pode executar:**
Autoridade competente / instância deliberativa

**Condições obrigatórias:**

* PCA consolidado
* Registro da decisão colegiada ou despacho formal

**Gatilho:**
Manual (decisão formal)

---

### 3.5 Aprovada no PCA → Em Planejamento da Contratação

**Quem pode executar:**
Área demandante ou área de contratações

**Condições obrigatórias:**

* Existência de PCA aprovado
* Vinculação ao exercício vigente

**Gatilho:**
Automático ou manual
*(ex.: abertura de DOD ou processo SEI)*

---

### 3.6 Aprovada no PCA → Não Executada no Exercício

**Quem pode executar:**
Área de planejamento

**Condições obrigatórias:**

* Encerramento do exercício
* Justificativa obrigatória

**Base normativa:**
CGPAR 45, art. 10

**Gatilho:**
Automático (virada do exercício) com validação manual

---

### 3.7 Não Executada no Exercício → Reprogramada para Exercício Seguinte

**Quem pode executar:**
Área de planejamento + autoridade competente

**Condições obrigatórias:**

* Manutenção da necessidade
* Justificativa atualizada
* Aprovação no novo PCA

**Observação importante:**
Gera **nova instância de demanda**, com vínculo histórico.

---

### 3.8 Qualquer Status Ativo → Cancelada

**Quem pode executar:**
Perfil compatível com a fase (planejamento ou autoridade)

**Condições obrigatórias:**

* Justificativa detalhada
* Indicação do motivo do cancelamento

**Observação:**
Cancelamento **não apaga** a demanda.

---

### 3.9 Contratada → Encerrada

**Quem pode executar:**
Sistema ou área gestora

**Condições obrigatórias:**

* Contrato formalizado
* Registro do número do contrato

**Gatilho:**
Automático (integração) ou manual

---

## 4. Regras de Bloqueio e Exceção

### Bloqueios Sistêmicos Obrigatórios

* ❌ Demandas **não aprovadas no PCA** não podem iniciar contratação
* ❌ Demandas canceladas não podem ser reativadas
* ❌ Alterações retroativas de status são proibidas

### Exceções Controladas

* Reabertura de demanda encerrada **somente por autoridade competente**
* Deve gerar:

  * Novo ciclo
  * Novo registro de auditoria

---

## 5. Requisitos Técnicos para Implementação

Cada transição deve registrar:

* Status anterior
* Status novo
* Usuário
* Data/hora
* Justificativa (quando aplicável)
* Documento ou evento associado

Esses registros **não podem ser apagados**.

---
