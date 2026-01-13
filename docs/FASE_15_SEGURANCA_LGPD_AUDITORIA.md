# Fase 15 – Segurança, LGPD e Trilhas de Auditoria Avançadas

## 1. Objetivo da Fase

Definir a estratégia completa de **segurança da informação**, **proteção de dados pessoais (LGPD)** e **trilhas de auditoria avançadas** do SIGCON, garantindo:

- Confidencialidade, integridade e disponibilidade das informações;
- Conformidade legal e regulatória;
- Rastreabilidade integral dos atos administrativos;
- Suporte a auditorias internas e externas;
- Evidências digitais confiáveis para órgãos de controle.

Esta fase encerra a documentação inicial do sistema.

---

## 2. Princípios de Segurança Adotados

O SIGCON adota os seguintes princípios estruturantes:

- **Segurança por design (Security by Design)**  
- **Privacidade por padrão (Privacy by Default)**  
- **Menor privilégio (Least Privilege)**  
- **Segregação de funções**  
- **Rastreabilidade total dos atos**  
- **Não repúdio e integridade das evidências**  

---

## 3. Modelo de Segurança da Informação

### 3.1 Autenticação

- Autenticação baseada em credenciais individuais.
- Hash de senha utilizando algoritmo forte (ex.: bcrypt ou Argon2).
- Política mínima:
  - Complexidade de senha;
  - Expiração periódica (configurável);
  - Bloqueio por tentativas inválidas consecutivas.
- Preparado para integração futura com:
  - LDAP / Active Directory;
  - Login único institucional (SSO).

---

### 3.2 Autorização e Controle de Acesso

- Controle de acesso baseado em **perfis e permissões granulares**.
- Permissões definidas por:
  - Funcionalidade;
  - Tipo de operação (visualizar, criar, editar, aprovar, excluir);
  - Etapa do fluxo (DFD, PCA, aprovação, consolidação).
- Avaliação de permissão **em tempo real**, no backend.
- Nenhuma decisão crítica baseada apenas no frontend.

---

### 3.3 Segregação de Funções

O sistema impede, por regra:

- Que o mesmo usuário:
  - Cadastre e aprove o mesmo DFD;
  - Consolide e aprove o mesmo PCA;
  - Revise e homologue a própria ação.
- Regras alinhadas às boas práticas da CGPAR e à Lei nº 13.303/2016.

---

## 4. LGPD – Proteção de Dados Pessoais

### 4.1 Classificação dos Dados

No SIGCON, os dados são classificados como:

- **Dados institucionais** (processos, PCA, DFD, contratos);
- **Dados pessoais comuns**:
  - Nome;
  - CPF;
  - Matrícula;
  - Cargo/Função;
  - E-mail institucional.
- **Dados sensíveis**:  
  - Não tratados pelo sistema.

---

### 4.2 Bases Legais

O tratamento de dados pessoais fundamenta-se em:

- Cumprimento de obrigação legal e regulatória;
- Execução de políticas públicas;
- Exercício regular de direitos pela Administração Pública.

Não há tratamento baseado em consentimento.

---

### 4.3 Minimização e Finalidade

- Apenas dados estritamente necessários são coletados.
- Não há campos livres para inclusão de dados sensíveis.
- Campos textuais possuem orientações explícitas de uso.

---

### 4.4 Direitos do Titular

O SIGCON suporta, via procedimentos administrativos:

- Identificação dos dados associados a um usuário;
- Exportação controlada de informações;
- Restrição de acesso conforme desligamento ou mudança de função.

A exclusão física de dados pessoais é vedada quando houver obrigação legal de guarda, sendo aplicado o bloqueio lógico.

---

## 5. Segurança de Dados

### 5.1 Comunicação

- Todo tráfego protegido por HTTPS/TLS.
- Rejeição de conexões inseguras.
- Headers de segurança configurados no backend.

---

### 5.2 Banco de Dados

- Acesso restrito por credenciais específicas.
- Usuários distintos para:
  - Aplicação;
  - Administração;
  - Backup.
- Princípio do menor privilégio aplicado aos usuários do banco.

---

### 5.3 Backups

- Backups periódicos automatizados.
- Criptografia em repouso.
- Política de retenção alinhada às normas internas da organização.
- Testes periódicos de restauração.

---

## 6. Trilhas de Auditoria – Conceito Geral

O SIGCON implementa **auditoria técnica e funcional**, registrando:

- Quem fez;
- O quê foi feito;
- Quando;
- Em qual contexto;
- Qual era o estado anterior;
- Qual passou a ser o estado posterior.

As trilhas são **imutáveis**, **versionadas** e **consultáveis**.

---

## 7. Eventos Auditáveis Obrigatórios

### 7.1 Autenticação e Sessão

- Login bem-sucedido;
- Tentativas de login inválidas;
- Logout;
- Expiração de sessão.

---

### 7.2 Gestão de Usuários e Perfis

- Criação de usuário;
- Alteração de perfil;
- Ativação/Inativação;
- Troca de permissões.

---

### 7.3 DFD – Documento de Formalização de Demanda

- Criação;
- Edição;
- Envio;
- Devolução;
- Aprovação;
- Reprovação;
- Cancelamento.

---

### 7.4 PCA – Plano de Contratações Anual

- Consolidação de demandas;
- Alterações de prioridade;
- Aprovação;
- Reprovação;
- Revisões e versões;
- Publicação.

---

### 7.5 Integrações e Exportações

- Geração de relatórios;
- Exportação de dados;
- Integrações externas (quando existirem).

---

## 8. Estrutura da Trilha de Auditoria

Cada registro de auditoria contém, no mínimo:

- Identificador único do evento;
- Usuário responsável;
- Perfil ativo no momento da ação;
- Data e hora (timezone padronizado);
- Tipo de evento;
- Entidade afetada (DFD, PCA, Usuário etc.);
- Identificador da entidade;
- Valores antes da alteração (quando aplicável);
- Valores após a alteração (quando aplicável);
- Endereço IP;
- Identificador da sessão.

---

## 9. Imutabilidade e Integridade

- Registros de auditoria **não podem ser alterados ou excluídos**.
- Qualquer tentativa de exclusão lógica é bloqueada por regra de negócio.
- Acesso somente leitura, restrito a perfis autorizados.

---

## 10. Consulta e Relatórios de Auditoria

O SIGCON oferece:

- Filtros por:
  - Período;
  - Usuário;
  - Tipo de evento;
  - Entidade;
  - Unidade organizacional.
- Exportação controlada para:
  - PDF;
  - CSV.
- Relatórios específicos para:
  - Auditoria interna;
  - CGU;
  - TCU;
  - Conselhos e comitês.

---

## 11. Evidências Digitais

Os registros do SIGCON são considerados:

- Evidências administrativas formais;
- Suporte à tomada de decisão;
- Base para responsabilização funcional;
- Insumos para processos de apuração.

A integridade das evidências é garantida por:
- Controle de acesso;
- Imutabilidade;
- Versionamento;
- Backups.

---

## 12. Monitoramento e Alertas

Estrutura preparada para:

- Identificação de padrões anômalos;
- Alertas de tentativas de acesso indevido;
- Detecção de ações incompatíveis com o perfil;
- Subsídio a ações de compliance e corregedoria.

---

## 13. Conformidade Regulatória

O modelo de segurança e auditoria do SIGCON está alinhado a:

- Lei nº 13.303/2016;
- Resolução CGPAR nº 45/2022;
- Lei Geral de Proteção de Dados – LGPD.

---

## 14. Encerramento da Documentação Inicial

Com a conclusão desta fase, o SIGCON possui documentação inicial completa, cobrindo:

- Governança;
- Arquitetura;
- Modelagem de dados;
- Regras de negócio;
- Segurança;
- LGPD;
- Auditoria avançada.

As evoluções futuras deverão seguir o modelo de versionamento e governança definidos nas fases anteriores.

**Fase 15 concluída.**
