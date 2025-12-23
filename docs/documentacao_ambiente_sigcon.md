# SIGCON – Documentação do Ambiente de Desenvolvimento

## 1. Visão Geral

O **SIGCON (Sistema Integrado de Gestão de Contratações)** é uma plataforma web em desenvolvimento, baseada em arquitetura **API-first**, composta por:

- **Backend**: Laravel (PHP), executando em Docker
- **Frontend**: Angular (standalone), executando localmente
- **Integração**: HTTP REST via proxy do Angular

Este documento consolida a **Fase 1 – Configuração do Ambiente**, sem incluir qualquer desenvolvimento de MVP ou regras de negócio.

---

## 2. Arquitetura do Ambiente Local

### 2.1 Topologia adotada

```
[ Navegador ]
      |
      v
[ Angular Dev Server :4200 ]
      |
      |  /api/*
      v
[ Proxy Angular ]
      |
      v
[ Laravel API :8000 (Docker) ]
```

### Decisões arquiteturais

- O **frontend** roda fora do Docker, via Angular Dev Server
- O **backend** roda dentro do Docker
- A comunicação é feita via **proxy do Angular**, eliminando problemas de CORS
- O ambiente local aproxima-se do cenário real de produção

---

## 3. Pré-requisitos

### 3.1 Sistema operacional

- Linux nativo **ou** WSL2 (Ubuntu recomendado)

### 3.2 Ferramentas obrigatórias

| Ferramenta | Versão recomendada |
|-----------|--------------------|
| Docker | Docker Desktop (WSL2) |
| Docker Compose | v2+ |
| Node.js | 18 LTS ou 20 LTS |
| npm | Compatível com Node |
| Angular CLI | Versão compatível com o projeto |
| Git | Versão recente |

**Observação importante:**
O Node.js deve estar instalado **no ambiente Linux/WSL**, e não no Windows, para evitar falhas com Vite, Rollup e esbuild.

---

## 4. Estrutura do Projeto

```
sigcon/
├── backend/                # Laravel (Docker)
├── frontend/               # Angular (standalone)
│   ├── proxy.conf.json
│   ├── angular.json
│   ├── package.json
│   └── src/
├── docker-compose.yml
└── docs/                   # Documentação do projeto
```

---

## 5. Backend – Laravel (API)

### 5.1 Subir o backend

Na raiz do projeto:

```bash
docker compose up -d
```

### 5.2 Endpoints de validação

- API base:
  ```
  http://localhost:8000
  ```
- Endpoint de teste:
  ```
  http://localhost:8000/api/v1/demandas
  ```

### 5.3 Comandos úteis

```bash
docker compose exec backend php artisan route:list
docker compose exec backend php artisan config:clear
docker compose exec backend php artisan optimize:clear
```

---

## 6. Frontend – Angular (standalone)

### 6.1 Instalação das dependências

```bash
cd frontend
npm install
```

### 6.2 Script oficial de desenvolvimento

```bash
npm start
```

Este comando:
- Sobe o Angular em `http://localhost:4200`
- Ativa o proxy automaticamente
- É o **único comando recomendado** para desenvolvimento

---

## 7. Proxy do Angular (configuração crítica)

### 7.1 Arquivo de proxy

`frontend/proxy.conf.json`

```json
{
  "/api": {
    "target": "http://localhost:8000",
    "secure": false,
    "changeOrigin": true
  }
}
```

### 7.2 Registro no Angular

No arquivo `angular.json`:

```json
"serve": {
  "options": {
    "proxyConfig": "proxy.conf.json"
  }
}
```

### 7.3 Resultado esperado

- O frontend realiza chamadas para:
  ```
  /api/v1/demandas
  ```
- O proxy redireciona para:
  ```
  http://localhost:8000/api/v1/demandas
  ```
- O navegador não enfrenta restrições de CORS

---

## 8. Configuração de Environment (Angular)

Arquivo: `frontend/src/environments/environment.ts`

```ts
export const environment = {
  production: false,
  apiUrl: '/api/v1'
};
```

---

## 9. Validação do Ambiente

### Checklist final

- [x] Backend responde em `localhost:8000`
- [x] Angular sobe com `npm start`
- [x] Proxy configurado corretamente
- [x] Requisição `/api/v1/demandas` retorna HTTP 200
- [x] Dados aparecem na tela `/pca`
- [x] Nenhum erro funcional no console

Avisos de HMR ou Vite são normais no ambiente de desenvolvimento.

---

## 10. Escopo Atual do Projeto

### Concluído

- Configuração completa do ambiente
- Integração frontend ↔ backend validada
- Arquitetura técnica estabilizada

### Não iniciado

- MVP
- Persistência real (migrations)
- Regras de negócio
- Autenticação
- Interface funcional definitiva

---

## 11. Próximos Passos

- Commit de estabilização do ambiente
- Tag opcional (ex.: `env-ready`)
- Início da **Fase 2 – Definição do MVP**, quando autorizado

---

## 12. Observações Finais

- Não misturar Node do Windows com projetos no WSL
- Sempre utilizar `npm start`
- Proxy é obrigatório no desenvolvimento
- Hostname de serviços Docker só funciona dentro da rede Docker

---

**Status:** Fase 1 – Configuração do Ambiente **concluída tecnicamente**.

