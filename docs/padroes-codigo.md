# Padrões de Código – SIGCON

## 1. Diretrizes Gerais

- Código limpo e legível
- Clareza acima de otimizações prematuras
- Padrões consistentes em todo o projeto

## 2. Backend (Laravel)

- Controllers enxutos
- Regras de negócio concentradas em Services
- Repositories para acesso a dados
- Uso de DTOs quando necessário
- Nomes de métodos e variáveis autoexplicativos
- Logs para eventos relevantes

## 3. Frontend (Angular)

- Componentização adequada
- Serviços para comunicação com API
- Separação de lógica e apresentação
- Uso consistente de observables
- Validações no frontend alinhadas ao backend

## 4. Versionamento

- Branch principal: main
- Commits pequenos e frequentes
- Mensagens de commit claras e objetivas
- Um commit deve resolver um único problema

## 5. Segurança e Qualidade

- Nunca versionar credenciais
- Uso obrigatório de variáveis de ambiente
- Tratamento adequado de erros
- Registro de ações relevantes para auditoria
