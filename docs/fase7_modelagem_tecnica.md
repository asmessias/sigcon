Segue **EXATAMENTE todo o conteúdo da Fase 7 – Modelagem Técnica do Sistema (MVP)**, **sem qualquer alteração, síntese ou acréscimo**, em **formato Markdown**, pronto para inclusão direta na documentação do SIGCON.

---

# Fase 7 – Modelagem Técnica do Sistema (MVP)

## 1. Objetivo da Fase

Definir a modelagem técnica mínima necessária para viabilizar o **SIGCON – Sistema Integrado de Gestão de Contratações**, contemplando:

* estrutura lógica do sistema;
* principais entidades de dados;
* fluxos técnicos essenciais;
* regras de negócio críticas;
* pontos de integração;
* escopo técnico restrito ao MVP.

Esta fase **não trata de UX detalhado**, **não antecipa funcionalidades avançadas** e **não inclui módulos fora do planejamento das contratações**.

---

## 2. Escopo Técnico do MVP

O MVP do SIGCON contempla **exclusivamente o ciclo de planejamento das contratações**, abrangendo:

1. Cadastro e gestão de usuários e perfis
2. Cadastro de unidades organizacionais
3. Elaboração do Documento de Formalização de Demanda (DFD)
4. Análise, devolução e aprovação de DFDs
5. Consolidação das demandas
6. Formação do Plano de Contratações Anual (PCA)
7. Aprovação, reprovação e versionamento do PCA
8. Rastreabilidade completa entre DFD ↔ PCA

**Explicitamente fora do MVP:**

* execução da contratação;
* gestão contratual;
* integração ativa com Compras.gov.br/PGC (somente preparo estrutural);
* indicadores gerenciais avançados;
* workflows paralelos ou customizáveis.

---

## 3. Arquitetura Lógica do Sistema

### 3.1 Estilo Arquitetural

* Arquitetura **modular monolítica**, orientada a domínio
* Separação clara entre:

  * camada de apresentação;
  * camada de aplicação (casos de uso);
  * camada de domínio;
  * camada de persistência.

Justificativa:

* reduz complexidade inicial;
* facilita governança e controle;
* permite futura evolução para microsserviços.

---

### 3.2 Módulos do MVP

| Módulo                     | Responsabilidade                            |
| -------------------------- | ------------------------------------------- |
| Autenticação e Autorização | Controle de acesso por perfil               |
| Cadastro Organizacional    | Unidades, áreas requisitantes e técnicas    |
| DFD                        | Criação, edição, envio, análise e devolução |
| Consolidação               | Agrupamento e qualificação das demandas     |
| PCA                        | Formação, versionamento e aprovação         |
| Auditoria                  | Registro de eventos e trilha de decisões    |

---

## 4. Modelagem de Dados – Entidades Principais (MVP)

### 4.1 Usuário

* id
* nome
* email
* perfil (enum)
* unidade_id
* ativo

Perfis mínimos:

* Requisitante
* Área Técnica
* Setor de Contratações (GEPAC)
* Autoridade Competente
* Administrador do Sistema

---

### 4.2 Unidade Organizacional

* id
* nome
* sigla
* tipo (superintendência, gerência, setor, etc.)
* unidade_pai_id (opcional)

---

### 4.3 Documento de Formalização de Demanda (DFD)

Campos mínimos, aderentes ao Decreto nº 10.947/2022:

* id
* ano_pca
* unidade_requisitante_id
* justificativa_necessidade
* descricao_objeto
* quantidade_estimativa
* valor_estimado
* grau_prioridade (baixo | médio | alto)
* data_prevista_contratacao
* dependencias (texto)
* status
* data_criacao
* data_ultima_atualizacao
* usuario_criador_id

---

### 4.4 Item de DFD (Material / Serviço)

* id
* dfd_id
* tipo (material | serviço)
* grupo
* classe
* pdm (quando aplicável)
* item_catalogo
* valor_estimado

---

### 4.5 PCA

* id
* ano_referencia
* status (em elaboração | aprovado | reprovado | publicado)
* data_aprovacao
* versao
* usuario_aprovador_id

---

### 4.6 Relação PCA ↔ DFD

* pca_id
* dfd_id
* situacao_no_pca (aprovada | reprovada | excluída)
* justificativa (quando aplicável)

---

## 5. Estados e Fluxos Técnicos (MVP)

### 5.1 Fluxo do DFD

1. Em elaboração
2. Enviado para análise
3. Em análise pela área técnica / GEPAC
4. Devolvido para ajustes
5. Aprovado para consolidação

Regras:

* DFD aprovado não pode ser editado
* DFD devolvido retorna para o requisitante original
* Histórico de versões deve ser preservado

---

### 5.2 Fluxo do PCA

1. Em formação
2. Em análise
3. Aprovado
4. Reprovado

Regras:

* PCA aprovado gera versão imutável
* Alterações exigem nova versão
* PCA reprovado retorna para consolidação

---

## 6. Regras de Negócio Essenciais

* Um DFD pertence a **um único ano de PCA**
* DFD não incluído em PCA deve ser justificado
* DFD pode ser reaproveitado em PCA futuro **somente com justificativa**
* PCA aprovado pode ser alterado, gerando **nova versão**
* Todo ato decisório deve gerar **registro de auditoria**

---

## 7. Auditoria e Rastreabilidade (Obrigatório no MVP)

Registrar automaticamente:

* criação, edição e envio de DFD;
* devoluções e aprovações;
* consolidação no PCA;
* aprovação ou reprovação do PCA.

Campos mínimos de auditoria:

* entidade afetada
* ação realizada
* usuário
* data/hora
* justificativa (quando aplicável)

---

## 8. Integrações (Somente Preparação Estrutural)

No MVP:

* **nenhuma integração ativa**

Preparação prevista:

* estrutura de dados compatível com PGC;
* identificação de classes, grupos e itens conforme CATMAT/CATSER;
* exportação futura do PCA.

---

## 9. Considerações Técnicas Finais

* O MVP prioriza **governança, rastreabilidade e conformidade legal**
* A modelagem evita qualquer dependência tecnológica específica
* Todas as decisões aqui descritas são coerentes com:

  * Decreto nº 10.947/2022
  * Lei nº 13.303/2016
  * Resolução CGPAR nº 45/2022
  * Manuais oficiais de PCA/PGC analisados

---

Quando quiser, seguimos no próximo chat com a próxima fase do projeto.
