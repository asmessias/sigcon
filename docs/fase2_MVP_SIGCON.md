# SIGCON – Fase 2  
## Definição do MVP e Modelagem dos Fluxos

## 1. Contexto

O SIGCON – Sistema Integrado de Gestão de Contratações – está sendo desenvolvido com o objetivo de estruturar, padronizar e dar suporte digital ao processo de planejamento das contratações da Conab, em conformidade com:

- Lei nº 13.303/2016  
- Resolução CGPAR nº 45/2022  
- Regulamento de Licitações e Contratos da Conab (RLC)

Após a conclusão da **Fase 1 – Arquitetura e Configuração do Ambiente**, foi iniciada a **Fase 2**, dedicada à definição do MVP (Produto Mínimo Viável) do sistema.

---

## 2. Objetivo da Fase 2

Definir um MVP funcional, utilizável já no próximo ciclo do Plano Anual de Contratações (PCA), com foco em:

- Substituir planilhas e formulários dispersos  
- Padronizar a coleta e consolidação das demandas  
- Garantir rastreabilidade e governança  
- Criar base sólida para evolução futura do sistema  

---

## 3. Escopo do MVP do SIGCON

### 3.1 Funcionalidades incluídas no MVP

O MVP contempla exclusivamente o **Planejamento das Contratações Corporativas**, com os seguintes módulos:

1. Governança e Parametrização do PCA  
2. Coleta Estruturada das Demandas (DFD Digital)  
3. Análise e Consolidação das Demandas (GEPAC)  
4. Formação do PCA  
5. Aprovação e Publicação do PCA  
6. Auditoria e Rastreabilidade (mínimo viável)

### 3.2 Funcionalidades fora do MVP

Explicitamente fora do escopo inicial:

- Planejamento da contratação (ETP, TR, matriz de riscos)  
- Gestão contratual  
- Execução orçamentária  
- Integrações externas (SEI, SIAFI, Compras.gov)  
- Pré-qualificação de fornecedores  

Esses itens ficam mapeados para fases posteriores do projeto.

---

## 4. User Stories do MVP

### Épico 1 – Governança e Parametrização

- US-01: Cadastrar exercício do PCA  
- US-02: Manter unidades organizacionais  
- US-03: Gerenciar perfis de usuários  

### Épico 2 – Coleta das Demandas

- US-04: Criar demanda de contratação  
- US-05: Salvar demanda em rascunho  
- US-06: Enviar demanda para análise  
- US-07: Editar demanda antes do envio  

### Épico 3 – Análise e Consolidação (GEPAC)

- US-08: Visualizar demandas recebidas  
- US-09: Analisar e classificar demanda  
- US-10: Solicitar ajustes à área demandante  
- US-11: Consolidar demandas semelhantes  

### Épico 4 – Formação do PCA

- US-12: Gerar proposta do PCA  
- US-13: Versionar o PCA  
- US-14: Exportar o PCA (PDF e Excel)  

### Épico 5 – Aprovação e Publicação

- US-15: Submeter PCA para aprovação  
- US-16: Registrar decisão de aprovação  
- US-17: Publicar versão final do PCA  

### Épico 6 – Auditoria e Rastreabilidade

- US-18: Registrar histórico de alterações  

**Total:** 18 User Stories – cobrindo todo o ciclo do PCA no MVP.

---

## 5. Modelagem dos Fluxos do MVP

### 5.1 Fluxo A – Coleta da Demanda (Área Demandante)

**Objetivo:** permitir que as unidades registrem suas demandas de forma padronizada.

**Etapas principais:**
1. Seleção do exercício do PCA  
2. Criação da demanda  
3. Salvamento como rascunho  
4. Validação e envio  
5. Bloqueio da edição após envio  

**Status envolvidos:**  
- Em elaboração  
- Enviada  

---

### 5.2 Fluxo B – Análise e Consolidação (GEPAC)

**Objetivo:** garantir qualidade técnica, racionalização e aderência estratégica.

**Etapas principais:**
1. Visualização das demandas enviadas  
2. Análise técnica individual  
3. Decisão:  
   - Aprovada  
   - Ajustes solicitados  
   - Não aprovada  
4. Consolidação de demandas semelhantes  

**Status envolvidos:**  
- Enviada  
- Ajustes solicitados  
- Aprovada  
- Não aprovada  

---

### 5.3 Fluxo C – Formação, Aprovação e Publicação do PCA

**Objetivo:** formalizar o PCA como instrumento de governança.

**Etapas principais:**
1. Geração da proposta do PCA  
2. Criação de versões  
3. Submissão para aprovação  
4. Registro da decisão  
5. Publicação da versão final  
6. Exportação do PCA  

**Status do PCA:**  
- Minuta  
- Em aprovação  
- Aprovado  
- Publicado  

---

## 6. Regras de Governança do MVP

- Apenas demandas aprovadas integram o PCA  
- Toda decisão da GEPAC deve ser justificada  
- Apenas uma versão final de PCA por exercício  
- PCA publicado não pode ser alterado  
- Histórico de alterações deve ser preservado  

---

## 7. Benefícios do MVP

- Padronização institucional do PCA  
- Rastreabilidade e transparência  
- Redução de retrabalho  
- Base estruturada para auditoria e controle  
- Preparação para expansão futura do SIGCON  

---

## 8. Próxima fase planejada

**Fase 2.3 – Modelagem de Dados do MVP**

- Entidades principais  
- Relacionamentos  
- Campos obrigatórios  
- Base para o modelo de banco de dados  

---
