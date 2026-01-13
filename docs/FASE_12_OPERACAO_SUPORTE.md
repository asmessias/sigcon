# FASE 12 – ESTRATÉGIA DE OPERAÇÃO E SUPORTE  
Projeto SIGCON – Sistema de Gestão de Contratações

---

## 1. Objetivo da Fase

Definir, de forma estruturada e sustentável, a estratégia de **operação, suporte, manutenção e evolução** do SIGCON após sua entrada em produção, assegurando:

- Continuidade do serviço;
- Estabilidade operacional;
- Atendimento aos usuários;
- Conformidade normativa;
- Capacidade de evolução controlada do sistema.

Esta fase estabelece como o SIGCON será operado no dia a dia, quem presta suporte, como incidentes são tratados e como mudanças serão gerenciadas.

---

## 2. Escopo da Estratégia de Operação e Suporte

A estratégia contempla:

- Operação do sistema em ambiente produtivo;
- Suporte técnico e funcional aos usuários;
- Gestão de incidentes, problemas e requisições;
- Monitoramento e disponibilidade;
- Manutenção corretiva, adaptativa e evolutiva;
- Gestão de acessos e perfis;
- Backup, segurança e continuidade;
- Documentação operacional;
- Indicadores e melhoria contínua.

---

## 3. Princípios Orientadores

A operação do SIGCON será regida pelos seguintes princípios:

- **Disponibilidade**: sistema acessível conforme janela operacional definida;
- **Confiabilidade**: dados íntegros e consistentes;
- **Rastreabilidade**: registros de eventos, ações e decisões;
- **Segurança da informação**: controle de acessos e proteção de dados;
- **Simplicidade operacional**: processos claros e documentados;
- **Conformidade legal e normativa**: aderência à Lei nº 13.303/2016 e normativos internos;
- **Evolução contínua**: melhoria progressiva baseada em indicadores.

---

## 4. Modelo de Operação do SIGCON

### 4.1 Ambientes do Sistema

O SIGCON deverá operar, no mínimo, com os seguintes ambientes:

- **Desenvolvimento**: ajustes técnicos e novas funcionalidades;
- **Homologação**: validação funcional e testes de aceite;
- **Produção**: ambiente oficial de uso institucional.

Cada ambiente deve possuir:
- Base de dados própria;
- Controle de acesso independente;
- Política de versionamento definida.

---

### 4.2 Janela Operacional

- Operação regular: dias úteis, em horário administrativo;
- Manutenções programadas: fora do horário de pico, com comunicação prévia;
- Manutenções emergenciais: sempre que necessário para garantir continuidade.

---

## 5. Estrutura de Suporte

### 5.1 Níveis de Suporte

#### Nível 1 – Suporte Funcional
Responsável por:
- Dúvidas de uso do sistema;
- Orientação sobre fluxos (DFD, PCA, consolidação, aprovação);
- Análise inicial de erros reportados;
- Encaminhamento para Nível 2 quando necessário.

Perfil típico:
- Área de Planejamento das Contratações (ex.: GEPAC ou equivalente).

---

#### Nível 2 – Suporte Técnico
Responsável por:
- Análise técnica de erros;
- Correção de falhas de sistema;
- Ajustes de banco de dados quando autorizados;
- Apoio à homologação de correções.

Perfil típico:
- Equipe técnica interna ou desenvolvedor responsável pelo SIGCON.

---

#### Nível 3 – Evolução e Arquitetura
Responsável por:
- Alterações estruturais;
- Novas funcionalidades;
- Refatorações;
- Ajustes decorrentes de mudanças legais ou normativas.

---

## 6. Gestão de Incidentes e Requisições

### 6.1 Tipos de Chamados

- **Incidente**: falha que impacta o uso do sistema;
- **Problema**: causa raiz de incidentes recorrentes;
- **Requisição**: pedido de acesso, ajuste simples ou esclarecimento;
- **Mudança**: alteração funcional ou técnica planejada.

---

### 6.2 Fluxo de Atendimento

1. Registro do chamado;
2. Classificação (incidente, requisição, mudança);
3. Priorização;
4. Atendimento conforme nível de suporte;
5. Registro da solução;
6. Encerramento com validação do solicitante.

---

### 6.3 Critérios de Prioridade

- **Alta**: impacto crítico, paralisação do processo de contratações;
- **Média**: impacto parcial, solução temporária possível;
- **Baixa**: dúvidas, ajustes cosméticos ou melhorias futuras.

---

## 7. Monitoramento e Disponibilidade

A operação deverá contemplar:

- Monitoramento de disponibilidade do sistema;
- Monitoramento de erros de aplicação;
- Monitoramento de banco de dados;
- Verificação de integridade dos dados críticos (DFD, PCA, aprovações).

Sempre que possível, manter:
- Logs de acesso;
- Logs de erros;
- Trilhas de auditoria.

---

## 8. Backup, Segurança e Continuidade

### 8.1 Backup

- Backup diário da base de dados;
- Retenção mínima definida em norma interna;
- Testes periódicos de restauração.

---

### 8.2 Segurança

- Controle de acesso baseado em perfis e papéis;
- Princípio do menor privilégio;
- Registro de ações sensíveis;
- Proteção contra exclusões indevidas.

---

### 8.3 Continuidade do Serviço

- Procedimentos documentados para recuperação;
- Plano básico de contingência;
- Capacidade de retomada rápida em caso de falha crítica.

---

## 9. Gestão de Acessos e Perfis

- Solicitação formal de acesso;
- Concessão conforme perfil funcional definido na Fase 6;
- Revisão periódica de acessos;
- Revogação imediata em caso de desligamento ou mudança de função.

---

## 10. Manutenção do SIGCON

### 10.1 Tipos de Manutenção

- **Corretiva**: correção de erros;
- **Adaptativa**: adequação a mudanças legais ou institucionais;
- **Evolutiva**: novas funcionalidades e melhorias;
- **Preventiva**: ajustes para evitar falhas futuras.

---

### 10.2 Ciclo de Manutenção

1. Identificação da necessidade;
2. Análise de impacto;
3. Priorização;
4. Desenvolvimento;
5. Homologação;
6. Implantação controlada;
7. Atualização da documentação.

---

## 11. Documentação Operacional

Deverão ser mantidos atualizados:

- Manual do usuário;
- Manual operacional;
- Registro de versões;
- Histórico de mudanças;
- Procedimentos de suporte.

A documentação faz parte integrante da operação do SIGCON.

---

## 12. Indicadores Operacionais

Exemplos de indicadores recomendados:

- Tempo médio de atendimento;
- Quantidade de incidentes por período;
- Incidentes recorrentes;
- Disponibilidade do sistema;
- Volume de chamados por tipo.

Esses indicadores subsidiam a melhoria contínua.

---

## 13. Melhoria Contínua

A estratégia de operação e suporte deve ser revisada periodicamente para:

- Incorporar lições aprendidas;
- Ajustar processos;
- Melhorar a experiência do usuário;
- Aumentar a maturidade do SIGCON como sistema institucional.

---

## 14. Encerramento da Fase

A Fase 12 consolida o SIGCON como um **sistema operacionalmente sustentável**, preparado para uso contínuo, suporte estruturado e evolução controlada, servindo de base para a transição definitiva para a fase de **operação plena e governança contínua** do sistema.

---
