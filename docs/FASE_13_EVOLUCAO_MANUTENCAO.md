# FASE 13 – ESTRATÉGIA DE EVOLUÇÃO E MANUTENÇÃO

## 1. Objetivo da Fase

Definir a estratégia de evolução contínua e manutenção do SIGCON, garantindo:

- sustentabilidade técnica e funcional do sistema;
- aderência permanente ao arcabouço legal e normativo aplicável às contratações públicas;
- capacidade de adaptação a mudanças institucionais, normativas e operacionais;
- previsibilidade na gestão de melhorias, correções e ajustes evolutivos.

Esta fase consolida o SIGCON como um sistema vivo, sujeito a ciclos contínuos de aprimoramento.

---

## 2. Princípios Orientadores

A estratégia de evolução e manutenção do SIGCON será guiada pelos seguintes princípios:

- **Conformidade Legal Permanente**  
  Atualização contínua frente a alterações legais, normativas e orientações de órgãos de controle.

- **Evolução Incremental e Controlada**  
  Entregas graduais, priorizadas por valor institucional e risco.

- **Rastreabilidade e Governança**  
  Toda alteração deve ser registrada, versionada e aprovada formalmente.

- **Baixo Impacto Operacional**  
  Manutenções e evoluções não devem comprometer a operação regular do PCA e do DFD.

- **Documentação como Ativo Central**  
  Nenhuma evolução será considerada concluída sem a devida atualização documental.

---

## 3. Tipos de Manutenção

### 3.1 Manutenção Corretiva

Destinada à correção de falhas identificadas após a entrada em produção.

Abrange:
- erros de lógica de negócio;
- falhas de validação de dados;
- inconsistências de integração entre módulos;
- problemas de usabilidade que impactem o fluxo do usuário.

**Diretriz**  
Correções devem ser tratadas com prioridade quando afetarem:
- integridade dos dados do PCA ou DFD;
- cumprimento de prazos legais;
- rastreabilidade das decisões administrativas.

---

### 3.2 Manutenção Adaptativa

Voltada à adequação do SIGCON a mudanças externas.

Exemplos:
- alterações na Lei nº 13.303/2016;
- novos decretos ou instruções normativas sobre PCA, PGC ou PNCP;
- mudanças em sistemas estruturantes (Compras.gov.br, PGC, SEI).

**Diretriz**  
Nenhuma mudança normativa poderá ser operacionalizada manualmente fora do sistema por prazo prolongado; o SIGCON deve refletir a norma vigente.

---

### 3.3 Manutenção Evolutiva

Relacionada à inclusão de novas funcionalidades ou aprimoramento das existentes.

Exemplos:
- novos relatórios gerenciais;
- painéis de acompanhamento do PCA;
- indicadores de governança e conformidade;
- automações adicionais no fluxo do DFD.

**Diretriz**  
Toda evolução deve estar vinculada a:
- melhoria de governança;
- ganho de eficiência operacional;
- redução de riscos de não conformidade.

---

### 3.4 Manutenção Preventiva

Ações planejadas para evitar falhas futuras.

Inclui:
- revisão periódica de regras de negócio;
- validação de consistência dos dados;
- auditoria técnica de permissões e perfis;
- revisão de scripts de banco de dados e seeds.

---

## 4. Ciclo de Evolução do SIGCON

O ciclo padrão de evolução seguirá as etapas abaixo:

1. **Identificação da Necessidade**
   - demanda normativa;
   - sugestão de usuário;
   - achado de auditoria;
   - análise interna da GEPAC.

2. **Classificação da Demanda**
   - corretiva;
   - adaptativa;
   - evolutiva;
   - preventiva.

3. **Análise de Impacto**
   - impacto legal;
   - impacto operacional;
   - impacto técnico;
   - impacto na base de dados.

4. **Priorização**
   - criticidade;
   - prazo legal;
   - risco institucional;
   - esforço estimado.

5. **Implementação**
   - desenvolvimento;
   - testes;
   - validação funcional.

6. **Homologação**
   - aceite formal da área responsável.

7. **Implantação**
   - aplicação controlada em produção.

8. **Atualização Documental**
   - manuais;
   - fluxos;
   - regras de negócio;
   - histórico de versões.

---

## 5. Gestão de Versões

### 5.1 Versionamento do Sistema

O SIGCON adotará versionamento semântico:

- **MAJOR** – alterações com impacto estrutural ou legal relevante;
- **MINOR** – novas funcionalidades sem quebra de compatibilidade;
- **PATCH** – correções e ajustes pontuais.

Exemplo: v2.1.3

---

### 5.2 Registro de Mudanças (Changelog)

Toda versão deverá conter:

- número da versão;
- data de liberação;
- tipo de manutenção;
- descrição objetiva da alteração;
- referência normativa (quando aplicável).

---

## 6. Governança da Evolução

### 6.1 Instância Responsável

A evolução e manutenção do SIGCON será coordenada pela **Gerência de Planejamento das Contratações (GEPAC)**, com apoio das áreas técnicas e administrativas.

### 6.2 Responsabilidades

- **GEPAC**
  - priorização das demandas;
  - validação funcional;
  - alinhamento normativo.

- **Área Técnica de TI**
  - implementação técnica;
  - controle de versões;
  - manutenção da infraestrutura.

- **Áreas Usuárias**
  - identificação de necessidades;
  - testes funcionais;
  - feedback operacional.

---

## 7. Documentação e Base de Conhecimento

A documentação do SIGCON deverá ser tratada como parte integrante do sistema.

Inclui:
- manuais operacionais;
- fluxos de negócio;
- regras de validação;
- padrões de preenchimento do DFD e PCA;
- histórico de alterações.

**Regra obrigatória**  
Nenhuma alteração entra em produção sem documentação atualizada.

---

## 8. Indicadores de Evolução e Manutenção

Serão monitorados, no mínimo:

- quantidade de demandas corretivas por período;
- tempo médio de atendimento de correções;
- número de evoluções entregues por ciclo;
- aderência às normas vigentes;
- reincidência de falhas.

---

## 9. Riscos Associados à Evolução

Principais riscos mitigados por esta estratégia:

- desatualização normativa do sistema;
- dependência excessiva de controles manuais;
- perda de rastreabilidade das decisões;
- fragilidade documental;
- obsolescência técnica.

---

## 10. Encerramento da Fase

A Fase 13 consolida o SIGCON como um sistema institucional permanente, preparado para:

- evoluir de forma controlada;
- manter conformidade legal contínua;
- sustentar a governança das contratações;
- apoiar a tomada de decisão estratégica.

Com esta fase, encerra-se o ciclo de planejamento estratégico do SIGCON, iniciando-se sua operação contínua, orientada por melhoria permanente.
