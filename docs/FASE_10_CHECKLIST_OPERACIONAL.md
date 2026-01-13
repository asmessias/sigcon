# FASE 10 – CHECKLIST OPERACIONAL DE AMBIENTES

## 1. Objetivo da Fase 10

Estabelecer um checklist operacional completo e executável para garantir que qualquer ambiente do sistema possa ser preparado, validado e operado de forma padronizada, segura e rastreável, reduzindo riscos operacionais, retrabalho e dependência de conhecimento tácito.

Este checklist é documento obrigatório para:
- Onboarding de novos integrantes;
- Auditorias internas e externas;
- Transição entre ambientes;
- Operação contínua do sistema.

Nenhum ambiente pode ser considerado ativo sem o cumprimento integral deste checklist.

---

## 2. Ambientes Abrangidos

O checklist se aplica, no mínimo, aos seguintes ambientes:

| Ambiente | Finalidade |
|--------|-----------|
| Local (DEV) | Desenvolvimento individual e testes técnicos |
| Homologação (HML) | Validação funcional, regras de negócio e fluxos |
| Produção (PRD) | Operação oficial do sistema |

---

## 3. Checklist – Infraestrutura Base

### 3.1 Sistema Operacional
- [ ] Sistema operacional definido e documentado  
- [ ] Timezone configurado (ex.: America/Sao_Paulo)  
- [ ] Locale UTF-8 configurado  
- [ ] Sincronização de horário ativa  

### 3.2 Dependências Básicas
- [ ] Git instalado e configurado  
- [ ] Docker e Docker Compose (se aplicável)  
- [ ] Runtime da aplicação instalado (versão exata documentada)  
- [ ] Ferramentas auxiliares instaladas (curl, make, etc.)  

---

## 4. Checklist – Banco de Dados

### 4.1 Acesso e Conectividade
- [ ] Banco de dados criado (nome padronizado por ambiente)  
- [ ] Usuário dedicado por ambiente  
- [ ] Privilégios mínimos configurados  
- [ ] Conexão validada pela aplicação  

### 4.2 Versionamento e Estrutura
- [ ] Diretório `/database/migrations` existente e validado  
- [ ] Diretório `/database/seeds` existente e validado  
- [ ] Ordem de execução documentada conforme Fase 9  
- [ ] Controle de versão do schema ativo  

### 4.3 Execução Inicial
- [ ] Todas as migrations executadas sem erro  
- [ ] Seeds iniciais aplicados com sucesso  
- [ ] Integridade referencial validada  
- [ ] Constraints e índices verificados  

---

## 5. Checklist – Configuração da Aplicação

### 5.1 Variáveis de Ambiente
- [ ] Arquivo `.env` criado por ambiente  
- [ ] Credenciais segregadas por ambiente  
- [ ] Flags de debug configuradas corretamente  
- [ ] URLs, endpoints e serviços externos validados  

### 5.2 Inicialização da Aplicação
- [ ] Build da aplicação concluído com sucesso  
- [ ] Aplicação inicia sem erros críticos  
- [ ] Logs iniciais sem warnings impeditivos  

---

## 6. Checklist – Regras de Negócio (DFD e PCA)

### 6.1 Documento de Formalização de Demanda (DFD)
- [ ] Criação de DFD funcional  
- [ ] Validação de campos obrigatórios  
- [ ] Justificativa da necessidade obrigatória  
- [ ] Associação correta à área requisitante  

### 6.2 Plano de Contratações Anual (PCA)
- [ ] Consolidação de DFDs funcional  
- [ ] Fluxo de aprovação operacional  
- [ ] Regras de reprovação e devolução ativas  
- [ ] Versionamento do PCA funcionando  

### 6.3 Regras Críticas de Negócio
- [ ] Demanda não executada exige justificativa formal  
- [ ] PCA permite alterações controladas após publicação  
- [ ] Alinhamento com planejamento e orçamento validado  

---

## 7. Checklist – Papéis, Perfis e Permissões

- [ ] Perfis cadastrados conforme definido na Fase 6  
- [ ] Permissões segregadas por papel  
- [ ] Bloqueio de ações não autorizadas validado  
- [ ] Registro de ações por perfil ativo  

---

## 8. Checklist – Logs, Auditoria e Rastreabilidade

- [ ] Log de autenticação ativo  
- [ ] Log de criação e alteração de DFD  
- [ ] Log de criação, alteração e publicação de PCA  
- [ ] Registro de data, usuário e ação disponível  

---

## 9. Checklist – Testes Operacionais

### 9.1 Testes Essenciais
- [ ] Criar DFD  
- [ ] Aprovar DFD  
- [ ] Reprovar DFD  
- [ ] Consolidar PCA  
- [ ] Publicar PCA  

### 9.2 Testes de Exceção
- [ ] DFD incompleto é bloqueado  
- [ ] Acesso indevido é negado  
- [ ] Transição de status inválida é impedida  

---

## 10. Checklist – Documentação Obrigatória

- [ ] README do projeto atualizado  
- [ ] Documentação de setup de ambiente  
- [ ] Documentação de banco de dados  
- [ ] Documentação de regras de negócio  
- [ ] Checklist operacional versionado no repositório  

---

## 11. Critérios de Conclusão da Fase 10

A Fase 10 é considerada concluída quando:

1. Todos os itens deste checklist estiverem concluídos;
2. O arquivo estiver versionado no repositório;
3. Um novo integrante consiga subir o ambiente sem auxílio externo;
4. O ambiente esteja apto para testes integrados ou operação.

---

# GUIA OPERACIONAL – PREPARAÇÃO COMPLETA DE AMBIENTE  
(Baseado na Fase 10 – Checklist Operacional de Ambientes)

Este guia descreve, passo a passo, todas as ações necessárias para preparar um novo ambiente
(Local, Homologação ou Produção) do projeto, atendendo integralmente ao checklist operacional.

Siga rigorosamente a ordem apresentada. Nenhuma etapa deve ser pulada.

---

## 1. Preparação Inicial

Antes de iniciar, tenha em mãos:
- Acesso ao repositório oficial do projeto;
- Permissão para criar banco de dados e usuários;
- Credenciais do ambiente (DEV, HML ou PRD);
- Este documento aberto para acompanhamento.

Crie um diretório de trabalho local e clone o repositório:

```bash
git clone <URL_DO_REPOSITORIO>
cd <NOME_DO_PROJETO>
````

---

## 2. Infraestrutura Base

### 2.1 Sistema Operacional

1. Verifique o sistema operacional:

   ```bash
   uname -a
   ```

2. Configure o timezone:

   ```bash
   sudo timedatectl set-timezone America/Sao_Paulo
   ```

3. Configure locale UTF-8:

   ```bash
   sudo locale-gen pt_BR.UTF-8
   sudo update-locale LANG=pt_BR.UTF-8
   ```

4. Verifique sincronização de horário:

   ```bash
   timedatectl status
   ```

---

### 2.2 Dependências Básicas

1. Instale o Git:

   ```bash
   sudo apt install git
   ```

2. Instale Docker e Docker Compose (se aplicável):

   ```bash
   sudo apt install docker docker-compose
   ```

3. Instale o runtime da aplicação conforme documentação do projeto
   (ex.: Node, Java, Python, etc.).

4. Instale ferramentas auxiliares:

   ```bash
   sudo apt install curl make unzip
   ```

---

## 3. Banco de Dados

### 3.1 Criação e Acesso

1. Acesse o SGBD:

   ```bash
   psql -U postgres
   ```

2. Crie o banco de dados do ambiente:

   ```sql
   CREATE DATABASE projeto_dev;
   ```

3. Crie um usuário dedicado:

   ```sql
   CREATE USER projeto_dev_user WITH PASSWORD 'senha_segura';
   ```

4. Conceda privilégios mínimos:

   ```sql
   GRANT ALL PRIVILEGES ON DATABASE projeto_dev TO projeto_dev_user;
   ```

5. Teste a conexão:

   ```bash
   psql -U projeto_dev_user -d projeto_dev
   ```

---

### 3.2 Versionamento e Estrutura

1. Acesse o diretório do banco:

   ```bash
   cd database
   ```

2. Confirme a existência dos diretórios:

   ```bash
   ls migrations
   ls seeds
   ```

3. Leia o documento da **Fase 9 – Versionamento e Seeds**
   para entender a ordem correta de execução.

---

### 3.3 Execução Inicial

1. Execute as migrations, na ordem definida:

   ```bash
   <comando_de_migration>
   ```

2. Execute os seeds iniciais:

   ```bash
   <comando_de_seed>
   ```

3. Verifique integridade referencial:

   ```sql
   SELECT * FROM information_schema.table_constraints;
   ```

4. Confirme índices e constraints:

   ```sql
   \d nome_da_tabela;
   ```

---

## 4. Configuração da Aplicação

### 4.1 Variáveis de Ambiente

1. Copie o arquivo de exemplo:

   ```bash
   cp .env.example .env
   ```

2. Edite o `.env`:

   * Nome do ambiente (DEV/HML/PRD)
   * Credenciais do banco
   * Flags de debug
   * URLs e integrações externas

3. Nunca reutilize `.env` de outro ambiente.

---

### 4.2 Inicialização da Aplicação

1. Execute o build:

   ```bash
   <comando_de_build>
   ```

2. Inicie a aplicação:

   ```bash
   <comando_de_start>
   ```

3. Verifique logs iniciais:

   ```bash
   tail -f logs/app.log
   ```

A aplicação deve iniciar sem erros críticos.

---

## 5. Regras de Negócio – DFD e PCA

### 5.1 Documento de Formalização de Demanda (DFD)

1. Acesse o sistema com perfil requisitante.
2. Crie um novo DFD.
3. Preencha todos os campos obrigatórios:

   * Justificativa da necessidade
   * Objeto
   * Área requisitante
   * Responsável
4. Salve e valide o DFD.

---

### 5.2 Plano de Contratações Anual (PCA)

1. Consolide os DFDs existentes.
2. Submeta o PCA para aprovação.
3. Execute reprovação e devolução de teste.
4. Aprove o PCA.
5. Valide versionamento.

---

### 5.3 Regras Críticas

1. Marque uma demanda como não executada.
2. Confirme exigência de justificativa.
3. Altere um PCA publicado (fluxo controlado).
4. Verifique alinhamento com orçamento.

---

## 6. Papéis, Perfis e Permissões

1. Cadastre todos os perfis definidos na Fase 6.
2. Associe permissões corretamente.
3. Teste acesso indevido:

   * A ação deve ser bloqueada.
4. Verifique registro da tentativa.

---

## 7. Logs, Auditoria e Rastreabilidade

1. Realize login e logout.
2. Crie e altere um DFD.
3. Crie, altere e publique um PCA.
4. Verifique logs contendo:

   * Usuário
   * Data e hora
   * Ação realizada

---

## 8. Testes Operacionais

### 8.1 Testes Essenciais

Execute, em sequência:

1. Criar DFD
2. Aprovar DFD
3. Reprovar DFD
4. Consolidar PCA
5. Publicar PCA

Todos devem funcionar sem erro.

---

### 8.2 Testes de Exceção

1. Tente salvar DFD incompleto → deve bloquear.
2. Acesse funcionalidade sem permissão → deve negar.
3. Force transição inválida de status → deve impedir.

---

## 9. Documentação Obrigatória

1. Atualize o README do projeto.
2. Verifique documentação:

   * Setup do ambiente
   * Banco de dados
   * Regras de negócio
3. Confirme que este checklist está versionado.

---

## 10. Encerramento e Validação Final

O ambiente está pronto quando:

* Todos os passos acima foram concluídos;
* Nenhuma etapa depende de ajuda externa;
* O sistema está operacional;
* O checklist da Fase 10 pode ser marcado como concluído.

Fim do procedimento.
