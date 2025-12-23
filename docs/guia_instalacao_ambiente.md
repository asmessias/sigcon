# SIGCON – Guia Rápido de Instalação e Configuração do Ambiente

Este documento orienta **um novo integrante da equipe** a instalar e configurar **rapidamente e sem erros** o ambiente de desenvolvimento do SIGCON.

O guia incorpora **lições aprendidas**, erros comuns e decisões técnicas tomadas durante a Fase 1 do projeto.

---

## 1. Objetivo deste Guia

* Permitir que um novo desenvolvedor suba o ambiente **do zero**
* Evitar erros recorrentes (Node/WSL, proxy, Docker, CORS, Angular standalone)
* Garantir que frontend e backend funcionem integrados logo no primeiro dia

> ⚠️ Este guia cobre **apenas ambiente**. Não aborda MVP, regras de negócio ou desenvolvimento funcional.

---

## 2. Visão Geral da Arquitetura Local

```
Navegador
   ↓
Angular Dev Server (localhost:4200)
   ↓  /api/*
Proxy Angular
   ↓
Laravel API (Docker – localhost:8000)
```

Decisões importantes:

* Frontend roda **fora do Docker**
* Backend roda **dentro do Docker**
* Comunicação via **proxy do Angular** (sem CORS)

---

## 3. Pré-requisitos Obrigatórios

### 3.1 Sistema Operacional

* Linux nativo **ou**
* Windows com **WSL2 (Ubuntu recomendado)**

> ⚠️ Todo o desenvolvimento deve ocorrer **dentro do Linux/WSL**.

---

### 3.2 Ferramentas Necessárias

| Ferramenta     | Versão recomendada       |
| -------------- | ------------------------ |
| Docker Desktop | Com suporte a WSL2       |
| Docker Compose | v2+                      |
| Node.js        | **18 LTS** (recomendado) |
| npm            | Compatível com Node      |
| Angular CLI    | Compatível com o projeto |
| Git            | Qualquer versão recente  |

---

## 4. Atenção CRÍTICA – Node.js no WSL

### ❌ O que NÃO fazer

* Não usar Node.js instalado no Windows
* Não rodar npm/ng em caminhos `\\wsl.localhost\\`

Isso causa erros como:

* `EPERM`
* erros de Rollup / esbuild
* falhas no `npm install`

---

### ✅ O que fazer (obrigatório)

Instalar Node.js **dentro do WSL**, preferencialmente via **nvm**.

```bash
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc
nvm install 18
nvm use 18
```

Validar:

```bash
node -v
npm -v
which node
```

O caminho **deve ser algo como**:

```
/home/usuario/.nvm/versions/node/...
```

---

## 5. Clonando o Projeto

No terminal Linux/WSL:

```bash
cd ~/projetos
git clone <URL_DO_REPOSITORIO_SIGCON>
cd sigcon
```

---

## 6. Subindo o Backend (Laravel + Docker)

### 6.1 Subir os containers

```bash
docker compose up -d
```

### 6.2 Validar o backend

Abrir no navegador:

```
http://localhost:8000/api/v1/demandas
```

Resultado esperado:

* HTTP 200
* JSON com dados de teste

---

## 7. Configurando o Frontend (Angular)

### 7.1 Instalar dependências

```bash
cd frontend
npm install
```

> ⚠️ Avisos de dependências deprecated são **normais** e podem ser ignorados.

---

### 7.2 Proxy do Angular (já versionado)

Arquivo existente:

```
frontend/proxy.conf.json
```

Conteúdo esperado:

```json
{
  "/api": {
    "target": "http://localhost:8000",
    "secure": false,
    "changeOrigin": true
  }
}
```

---

### 7.3 Proxy registrado no Angular

No arquivo `angular.json`, já existe:

```json
"serve": {
  "options": {
    "proxyConfig": "proxy.conf.json"
  }
}
```

> ⚠️ Sem isso, o proxy **não funciona**, mesmo com `--proxy-config`.

---

### 7.4 Subir o frontend (COMANDO OFICIAL)

```bash
npm start
```

Resultado esperado:

* Frontend disponível em `http://localhost:4200`
* Nenhum erro funcional no console

---

## 8. Validação Final do Ambiente

### Checklist obrigatório

* [ ] Backend responde em `localhost:8000`
* [ ] Frontend sobe com `npm start`
* [ ] Requisição `/api/v1/demandas` retorna HTTP 200
* [ ] Dados aparecem na rota `/pca`
* [ ] Nenhum erro crítico no console

> Avisos de HMR ou Vite são normais em desenvolvimento.

---

## 9. Problemas Comuns e Soluções Rápidas

### Dados não aparecem no frontend

* Verificar se o backend está rodando
* Confirmar proxy no `angular.json`
* Conferir Network → status da requisição

### Erro `No provider for HttpClient`

* Confirmar que `provideHttpClient()` está registrado no `main.ts`

### Erros de permissão (EPERM)

* Verificar se Node está rodando no WSL
* Nunca usar Node do Windows

---

## 10. Escopo Atual do Projeto

* ✅ Ambiente configurado
* ❌ MVP ainda não iniciado
* ❌ Sem regras de negócio
* ❌ Sem persistência real

---

## 11. Próximo Passo Após o Ambiente

Após concluir este guia, o desenvolvedor está apto a:

* Iniciar a **Fase 2 – Definição do MVP**
* Trabalhar com frontend e backend integrados
* Evoluir o SIGCON com base sólida

---

