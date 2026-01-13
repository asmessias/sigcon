# SIGCON – Fase 6  
## Regras de Negócio e Permissões do Sistema

---

## 1. Objetivo da Fase 6

Estabelecer, de forma estruturada:

1. Regras de negócio do SIGCON, vinculadas:
   - ao ciclo de vida da demanda;
   - ao PCA;
   - à legislação aplicável (Lei nº 13.303/2016, Decreto nº 10.947/2022, Resolução CGPAR nº 45/2022).
2. Modelo de permissões e alçadas, baseado em:
   - papéis organizacionais;
   - status da demanda;
   - segregação de funções;
   - trilha de auditoria.

---

# FASE 6 – BLOCO 6.1  
## Regras Gerais do Sistema

### RG-01 – Princípio da Segregação de Funções
Nenhum usuário poderá executar, sozinho, todas as etapas críticas de uma mesma demanda, especialmente:
- criação;
- validação técnica;
- consolidação institucional;
- aprovação do PCA.

Exceções somente quando previstas em norma interna e obrigatoriamente registradas em log.

---

### RG-02 – Regra de Imutabilidade por Status
Cada status do fluxo habilita um conjunto específico de ações.
Tentativas de execução fora do escopo:
- devem ser bloqueadas pelo sistema;
- devem gerar registro automático em log de auditoria.

---

### RG-03 – Regra do Ano-Orçamento
Toda demanda estará vinculada a:
- um exercício de referência do PCA;
- um exercício orçamentário.

Demandas não executadas:
- não migram automaticamente;
- exigem justificativa formal para reapresentação.

---

### RG-04 – Rastreabilidade Total
O SIGCON deve manter histórico completo de:
- alterações;
- transições de status;
- usuários;
- datas e horas;
- justificativas obrigatórias.

---

### RG-05 – Fonte Única da Verdade
Após consolidação no PCA, este passa a ser a referência oficial para:
- relatórios;
- dashboards;
- integrações externas.

---

### RG-06 – Publicação e Transparência
Somente demandas aprovadas podem:
- integrar PCA publicado;
- alimentar relatórios institucionais oficiais.

---

# FASE 6 – BLOCO 6.2  
## Regras de Negócio por Ciclo de Vida da Demanda  
*(Alinhado integralmente aos status definidos na Fase 5)*

## 1. Premissa Estrutural

O ciclo de vida da demanda no SIGCON é único, linear e rastreável, composto por 16 status formais e obrigatórios, organizados em macroetapas lógicas:

- Identificação da necessidade  
- Consolidação pela área requisitante  
- Elaboração e validação do DFD  
- Consolidação institucional e orçamentária  
- Elaboração, aprovação e publicação do PCA  
- Execução e encerramento  

Nenhum status pode ser suprimido, fundido ou “pulável” por regra de sistema.

---

## 2. Regras de Negócio por Status

### 1. Necessidade Identificada

Descrição  
Registro inicial da percepção de uma necessidade de contratação.

Papéis autorizados  
- Área Demandante  
- Área Requisitante  

Ações permitidas  
- Registrar necessidade  
- Classificar tipo preliminar (bem/serviço/obra)  
- Indicar unidade demandante  

Regras  
- Não há DFD neste status  
- Registro ainda não integra o PCA  

Transições possíveis  
- → Em Consolidação pela Área Requisitante  

---

### 2. Em Consolidação pela Área Requisitante

Descrição  
Agrupamento e organização de necessidades semelhantes dentro da área requisitante.

Papéis autorizados  
- Área Requisitante  

Ações permitidas  
- Agrupar necessidades  
- Priorizar internamente  
- Decidir quais necessidades gerarão DFD  

Regras  
- Uma ou mais necessidades podem originar um DFD  
- Necessidades podem ser descartadas sem DFD (com justificativa)  

Transições possíveis  
- → DFD em Elaboração  
- → Demanda Não Aprovada / Arquivada  

---

### 3. DFD em Elaboração

Descrição  
Elaboração formal do Documento de Formalização de Demanda.

Papéis autorizados  
- Área Requisitante  
- Área Técnica (quando aplicável)  

Ações permitidas  
- Preencher todos os campos do DFD  
- Incluir materiais/serviços  
- Salvar rascunhos  

Regras  
- DFD incompleto não pode avançar  
- Alterações são livres neste status  

Transições possíveis  
- → DFD em Análise Técnica  

---

### 4. DFD em Análise Técnica

Descrição  
Avaliação técnica da demanda quanto à aderência, padronização e viabilidade.

Papéis autorizados  
- Área Técnica  
- GEPAC (quando aplicável)  

Ações permitidas  
- Avaliar escopo  
- Ajustar classificação técnica  
- Solicitar ajustes  

Regras  
- Área requisitante não edita neste status  
- Toda decisão deve ser registrada  

Transições possíveis  
- → DFD Validado Tecnicamente  
- → DFD Devolvido para Ajustes  

---

### 5. DFD Devolvido para Ajustes

Descrição  
Retorno do DFD à área requisitante para correções.

Papéis autorizados  
- Área Requisitante  

Ações permitidas  
- Ajustar campos apontados  
- Justificar alterações  
- Reenviar  

Regras  
- Motivo da devolução é obrigatório  
- Histórico deve ser preservado  

Transições possíveis  
- → DFD em Análise Técnica  

---

### 6. DFD Validado Tecnicamente

Descrição  
DFD considerado tecnicamente adequado.

Papéis autorizados  
- Área Técnica  
- GEPAC  

Ações permitidas  
- Confirmar validação  
- Encaminhar para planejamento institucional  

Regras  
- Conteúdo do DFD torna-se estável  
- Alterações exigem justificativa formal  

Transições possíveis  
- → Em Consolidação Institucional (Planejamento)  

---

### 7. Em Consolidação Institucional (Planejamento)

Descrição  
Avaliação sistêmica da demanda no contexto institucional.

Papéis autorizados  
- GEPAC  

Ações permitidas  
- Agrupar demandas  
- Avaliar alinhamento estratégico  
- Ajustar cronograma e prioridade relativa  

Regras  
- Pode haver consolidação de múltiplos DFDs  
- Área requisitante apenas consulta  

Transições possíveis  
- → Em Análise Orçamentária  
- → Demanda Não Aprovada / Arquivada  

---

### 8. Em Análise Orçamentária

Descrição  
Verificação de compatibilidade orçamentária.

Papéis autorizados  
- Área Orçamentária  
- GEPAC  

Ações permitidas  
- Analisar disponibilidade de recursos  
- Ajustar estimativas  
- Emitir parecer  

Regras  
- Análise é condição obrigatória para o PCA  
- Parecer deve ser registrado  

Transições possíveis  
- → PCA em Elaboração  
- → Demanda Não Aprovada / Arquivada  

---

### 9. PCA em Elaboração

Descrição  
Construção da versão do PCA com demandas consolidadas.

Papéis autorizados  
- GEPAC  

Ações permitidas  
- Organizar demandas  
- Definir versão preliminar do PCA  

Transições possíveis  
- → PCA Submetido à Diretoria Executiva  

---

### 10. PCA Submetido à Diretoria Executiva

Descrição  
Envio do PCA para deliberação da Diretoria Executiva.

Papéis autorizados  
- Diretoria Executiva  

Ações permitidas  
- Aprovar  
- Reprovar  
- Solicitar ajustes  

Regras  
- Decisão deve ser motivada  

Transições possíveis  
- → PCA Aprovado pela Diretoria Executiva  
- → PCA em Elaboração  

---

### 11. PCA Aprovado pela Diretoria Executiva

Descrição  
Aprovação preliminar do PCA.

Papéis autorizados  
- GEPAC  

Ações permitidas  
- Preparar submissão ao Conselho  

Transições possíveis  
- → PCA Submetido ao Conselho de Administração  

---

### 12. PCA Submetido ao Conselho de Administração

Descrição  
Envio do PCA para instância máxima de governança.

Papéis autorizados  
- Conselho de Administração  

Ações permitidas  
- Aprovar  
- Reprovar  
- Determinar ajustes  

Transições possíveis  
- → PCA Aprovado pelo Conselho de Administração  
- → PCA em Elaboração  

---

### 13. PCA Aprovado pelo Conselho de Administração

Descrição  
Aprovação final do PCA.

Papéis autorizados  
- GEPAC  
- Alta Administração  

Ações permitidas  
- Autorizar publicação  

Transições possíveis  
- → PCA Publicado  

---

### 14. PCA Publicado

Descrição  
PCA oficialmente publicado e vigente.

Papéis autorizados  
- Consulta institucional e pública (quando aplicável)  

Regras  
- Inclusão de novas demandas é vedada  
- Alterações somente por revisão formal  

Transições possíveis  
- → PCA em Execução  

---

### 15. PCA em Execução

Descrição  
Execução das contratações previstas no PCA.

Papéis autorizados  
- Área de Contratações  
- GEPAC (acompanhamento)  

Ações permitidas  
- Vincular demandas a processos de contratação  
- Acompanhar execução  

Regras  
- Execução deve respeitar o PCA publicado  

---

### 16. Demanda Não Aprovada / Arquivada

Descrição  
Encerramento da demanda sem execução.

Papéis autorizados  
- GEPAC  
- Área Requisitante (consulta)  

Regras  
- Reativação automática vedada  
- Nova tentativa exige novo ciclo  

---

# FASE 6 – BLOCO 6.3  
## Modelo de Permissões e Alçadas do Sistema (SIGCON)

## 1. Princípios Gerais de Autorização

### P-01 – Autorização Condicionada
Nenhuma ação no SIGCON é autorizada apenas pelo papel do usuário.  
Toda permissão depende da combinação:

> Papel + Status da Demanda + Ação Solicitada

---

### P-02 – Segregação de Funções
Um mesmo usuário não pode elaborar o DFD, validá-lo tecnicamente, consolidá-lo institucionalmente e aprovar o PCA.

---

### P-03 – Alçada Decisória Formal
Ações de exclusão, reprovação, aprovação e publicação exigem papel com alçada explícita e registro motivado.

---

### P-04 – Imutabilidade Progressiva
À medida que a demanda avança, permissões e possibilidades de reversão se restringem.

---

## 2. Papéis Institucionais (RBAC)

1. Área Demandante  
2. Área Requisitante  
3. Área Técnica  
4. GEPAC / Planejamento Institucional  
5. Área Orçamentária  
6. Diretoria Executiva  
7. Conselho de Administração  
8. Área de Contratações  
9. Administrador do Sistema  
10. Perfil de Consulta / Controle  

## 3. Matriz de Permissões por Status (Síntese)

Legenda:  
- **C** = Criar  
- **E** = Editar  
- **A** = Analisar / Avaliar  
- **D** = Decidir (aprovar/reprovar)  
- **V** = Visualizar  
- **P** = Publicar  
- **X** = Não permitido  

---

### Status 1 – Necessidade Identificada

| Papel | Ações |
|---|---|
| Área Demandante | C, E |
| Área Requisitante | C, E |
| Demais papéis | V |

---

### Status 2 – Em Consolidação pela Área Requisitante

| Papel | Ações |
|---|---|
| Área Requisitante | E |
| Área Demandante | V |
| GEPAC | V |

---

### Status 3 – DFD em Elaboração

| Papel | Ações |
|---|---|
| Área Requisitante | E |
| Área Técnica | E |
| GEPAC | V |

---

### Status 4 – DFD em Análise Técnica

| Papel | Ações |
|---|---|
| Área Técnica | A |
| GEPAC | A |
| Área Requisitante | V |

---

### Status 5 – DFD Devolvido para Ajustes

| Papel | Ações |
|---|---|
| Área Requisitante | E |
| Área Técnica | V |
| GEPAC | V |

---

### Status 6 – DFD Validado Tecnicamente

| Papel | Ações |
|---|---|
| Área Técnica | D |
| GEPAC | A |
| Área Requisitante | V |

---

### Status 7 – Em Consolidação Institucional (Planejamento)

| Papel | Ações |
|---|---|
| GEPAC | E, A |
| Área Requisitante | V |
| Área Técnica | V |

---

### Status 8 – Em Análise Orçamentária

| Papel | Ações |
|---|---|
| Área Orçamentária | A |
| GEPAC | A |
| Demais | V |

---

### Status 9 – PCA em Elaboração

| Papel | Ações |
|---|---|
| GEPAC | E |
| Diretoria Executiva | V |
| Conselho de Administração | V |

---

### Status 10 – PCA Submetido à Diretoria Executiva

| Papel | Ações |
|---|---|
| Diretoria Executiva | D |
| GEPAC | V |

---

### Status 11 – PCA Aprovado pela Diretoria Executiva

| Papel | Ações |
|---|---|
| GEPAC | E |
| Diretoria Executiva | V |

---

### Status 12 – PCA Submetido ao Conselho de Administração

| Papel | Ações |
|---|---|
| Conselho de Administração | D |
| GEPAC | V |

---

### Status 13 – PCA Aprovado pelo Conselho de Administração

| Papel | Ações |
|---|---|
| GEPAC | E |
| Alta Administração | V |

---

### Status 14 – PCA Publicado

| Papel | Ações |
|---|---|
| Todos (interno) | V |
| Administrador do Sistema | P |

---

### Status 15 – PCA em Execução

| Papel | Ações |
|---|---|
| Área de Contratações | E |
| GEPAC | V |
| Área Requisitante | V |

---

### Status 16 – Demanda Não Aprovada / Arquivada

| Papel | Ações |
|---|---|
| GEPAC | V |
| Área Requisitante | V |
| Administrador do Sistema | V |

---

# FASE 6 – BLOCO 6.4  
## Regras de Exceção, Bloqueios e Tratamento de Situações Atípicas

## 1. Princípios Gerais

### E-01 – Exceção não é informalidade
Qualquer exceção ao fluxo padrão:
- deve estar expressamente prevista em regra de sistema;
- exige justificativa formal;
- gera registro automático em log de auditoria.

---

### E-02 – Exceção é sempre restritiva
Regras de exceção:
- não ampliam permissões;
- apenas permitem tratamento controlado de situações não ordinárias.

---

### E-03 – Rastreabilidade obrigatória
Toda exceção deve registrar, no mínimo:
- usuário solicitante;
- usuário autorizador;
- data e hora;
- fundamento da exceção;
- status anterior e posterior.

---

## 2. Exceções Relacionadas ao Fluxo da Demanda

### E-04 – Reabertura de DFD após Validação Técnica
A reabertura de um DFD após o status **DFD Validado Tecnicamente** não é automática.  
Somente é permitida nos seguintes casos:
- erro material identificado;
- alteração normativa superveniente;
- mudança estratégica formalmente registrada.

A autorização é de competência do **GEPAC**, devendo:
- haver justificativa expressa;
- o status retornar de forma controlada para **DFD em Elaboração** ou **DFD em Análise Técnica**;
- todo o evento ser registrado em log.

---

### E-05 – Retorno de Demanda após Consolidação Institucional
Demandas já no status **Em Consolidação Institucional (Planejamento)** só podem retornar a etapas anteriores:
- antes do status **PCA em Elaboração**;
- mediante justificativa técnica formal.

A decisão cabe ao **GEPAC**, com registro obrigatório.

---

### E-06 – Exclusão de Demanda após Consolidação
Após a consolidação institucional:
- a exclusão física é vedada;
- somente é permitido o **arquivamento lógico e motivado**.

O status de destino deve ser **Demanda Não Aprovada / Arquivada**.

---

## 3. Exceções Relacionadas ao PCA

### E-07 – Ajustes no PCA após Submissão à Diretoria Executiva
Após o PCA atingir o status **PCA Submetido à Diretoria Executiva**, ajustes somente são possíveis se:
- a Diretoria Executiva devolver formalmente o PCA.

Nesse caso, o PCA retorna ao status **PCA em Elaboração**.

---

### E-08 – Ajustes após Aprovação pela Diretoria Executiva
Erros identificados após o status **PCA Aprovado pela Diretoria Executiva** só podem ser tratados se:
- a própria Diretoria Executiva determinar revisão formal.

O PCA retorna ao status **PCA em Elaboração**.

---

### E-09 – Revisão após Submissão ao Conselho de Administração
O Conselho de Administração pode:
- aprovar;
- reprovar;
- ou devolver o PCA para ajustes.

A devolução implica retorno ao status **PCA em Elaboração**, com registro da decisão.

---

### E-10 – Alteração do PCA após Publicação
Alterações em PCA publicado são vedadas.  
Qualquer modificação somente pode ocorrer por:
- processo formal de revisão do PCA;
- nova aprovação pelo Conselho de Administração.

Cada revisão gera nova versão, preservando o histórico.

---

## 4. Demandas Urgentes Fora do Ciclo Ordinário

### E-11 – Demanda Emergencial não prevista no PCA
Demandas emergenciais, supervenientes e imprevisíveis:
- não ingressam no fluxo ordinário do PCA;
- devem ser registradas no SIGCON como **Demanda Emergencial**;
- exigem justificativa fundamentada.

A autorização compete à **Diretoria Executiva**.

---

## 5. Bloqueios Sistêmicos Obrigatórios

### B-01 – Bloqueio por Status
O sistema deve impedir qualquer ação não prevista para o status corrente.

---

### B-02 – Bloqueio por Papel
Usuários sem papel adequado:
- não visualizam ações;
- não executam ações via sistema ou API.

---

### B-03 – Bloqueio por Exercício
Demandas não podem ser migradas automaticamente entre exercícios.

---

### B-04 – Bloqueio de Exclusão
Após o status **DFD em Elaboração**, a exclusão física é proibida.

---

## 6. Tratamento de Inconsistências

### T-01 – Dados Incompletos
O sistema deve impedir avanço de status com dados obrigatórios ausentes.

---

### T-02 – Inconsistência Orçamentária
Demandas sem viabilidade orçamentária não avançam no fluxo.

---

### T-03 – Falha Sistêmica
Eventos críticos devem ser transacionais e registrados para auditoria.

---

# FASE 6 – BLOCO 6.5  
## Requisitos Transversais: Auditoria, Rastreabilidade, Conformidade e Relatórios

## 1. Princípios Fundamentais

### RT-01 – Transparência com controle
O SIGCON deve assegurar transparência compatível com o nível de governança, preservando:
- segregação de funções;
- confidencialidade quando aplicável;
- publicidade apenas após marcos formais (ex.: PCA publicado).

---

### RT-02 – Rastreabilidade integral
Todo dado relevante deve ser:
- rastreável no tempo;
- associado a um usuário, papel e unidade;
- passível de auditoria a posteriori.

---

### RT-03 – Evidência como regra
No SIGCON:
- não existe decisão sem evidência;
- não existe exceção sem justificativa;
- não existe alteração sem histórico.

---

## 2. Auditoria do Sistema

### RT-04 – Log de Auditoria Obrigatório
O sistema deve registrar, de forma automática e imutável:
- criação de registros;
- edição de qualquer campo relevante;
- mudança de status;
- decisões de aprovação/reprovação;
- arquivamentos;
- exceções e reaberturas;
- publicações e revisões do PCA.

Campos mínimos do log:
- identificador do evento;
- data e hora (timestamp);
- usuário;
- papel exercido no momento;
- unidade organizacional;
- ação executada;
- status anterior e posterior;
- justificativa (quando aplicável).

---

### RT-05 – Imutabilidade do Log
- Logs não podem ser alterados ou excluídos por usuários do sistema.
- Apenas administradores técnicos podem acessar logs brutos, sem permissão de edição.

---

### RT-06 – Auditoria por Demanda e por PCA
O sistema deve permitir:
- auditoria completa de uma demanda individual;
- auditoria consolidada do PCA por exercício;
- auditoria comparativa entre versões do PCA.

---

## 3. Versionamento e Histórico

### RT-07 – Versionamento de Demandas
Alterações relevantes devem:
- gerar nova versão lógica;
- preservar versões anteriores para consulta.

---

### RT-08 – Versionamento do PCA
Cada publicação ou revisão do PCA deve:
- gerar uma versão numerada;
- manter vínculo com a versão anterior;
- permitir comparação entre versões (diferenças).

---

### RT-09 – Preservação do Histórico
Demandas arquivadas:
- permanecem acessíveis para consulta histórica;
- não podem ser reativadas automaticamente;
- só podem ser reapresentadas por novo ciclo.

---

## 4. Conformidade Normativa e Governança

### RT-10 – Aderência ao Marco Legal
O SIGCON deve ser aderente, no mínimo, a:
- Lei nº 13.303/2016;
- Decreto nº 10.947/2022;
- Resolução CGPAR nº 45/2022;
- regulamentos internos da entidade.

O sistema deve impedir operações que contrariem essas normas.

---

### RT-11 – Segregação de Funções como Regra Técnica
A segregação definida no Bloco 6.3 deve ser:
- aplicada no backend (API);
- refletida no frontend (UI);
- validada em testes automatizados.

---

### RT-12 – Trilhas de Decisão
Decisões relevantes (aprovações, reprovações, arquivamentos) devem:
- conter motivação textual;
- estar associadas ao decisor;
- ser recuperáveis em relatórios e auditorias.

---

## 5. Relatórios Gerenciais e Institucionais

### RT-13 – Relatórios Operacionais
O SIGCON deve disponibilizar, no mínimo:
- demandas por status;
- demandas por unidade;
- demandas por exercício;
- tempo médio em cada status;
- gargalos de fluxo.

---

### RT-14 – Relatórios de Governança
Relatórios voltados à alta administração e órgãos de controle:
- demandas aprovadas x reprovadas;
- demandas não executadas;
- exceções e demandas emergenciais;
- histórico de revisões do PCA.

---

### RT-15 – Exportação e Transparência
Relatórios devem poder ser:
- exportados (PDF, CSV, planilha);
- utilizados em prestações de contas;
- publicados quando aplicável (ex.: PCA publicado).

---

## 6. Controle de Acesso e Perfis de Consulta

### RT-16 – Perfis de Consulta
O sistema deve prever perfis de:
- consulta institucional;
- auditoria interna;
- órgãos de controle.

Esses perfis:
- não executam ações;
- acessam dados conforme nível autorizado.

---

### RT-17 – Visibilidade Progressiva
- Antes do PCA publicado: acesso restrito.
- Após publicação: acesso ampliado, conforme política institucional.

---

## 7. Qualidade, Segurança e Confiabilidade

### RT-18 – Transações Atômicas
Mudanças críticas devem:
- ocorrer de forma transacional;
- evitar estados intermediários inconsistentes.

---

### RT-19 – Validações Sistêmicas
O SIGCON deve impedir:
- avanço de status com dados incompletos;
- decisões sem justificativa;
- ações fora da alçada do papel.

---

### RT-20 – Evidência para Órgãos de Controle
O sistema deve permitir:
- extração rápida de evidências;
- reconstrução fiel do histórico;
- comprovação de conformidade processual.
