# SIGCON – Guia de Configuração do Ambiente de Desenvolvimento

*(Frontend Angular + Backend Laravel + PostgreSQL)*

## 1. Visão Geral

Este documento descreve, passo a passo, como configurar o ambiente de desenvolvimento do **SIGCON – Sistema Integrado de Gestão de Contratações**, conforme definido e validado durante a Fase 3 do projeto.

Ao final deste guia, o desenvolvedor terá:

* Banco PostgreSQL configurado e íntegro;
* Backend Laravel conectado ao PostgreSQL;
* Frontend Angular Standalone integrado à API;
* Integração ponta a ponta validada (Frontend → API → Banco);
* Base pronta para evolução das regras de governança CGPAR.

---

## 2. Pré-requisitos

### 2.1. Sistema Operacional

* Linux (Ubuntu 20.04+ recomendado)

### 2.2. Softwares necessários

* PostgreSQL 14+
* PHP 8.1 ou superior
* Composer
* Node.js 18+
* Angular CLI 17+
* Git

---

## 3. Estrutura do Projeto

Estrutura adotada no repositório:

```
sigcon/
├── backend/        # Laravel
│   ├── artisan
│   ├── app/
│   ├── routes/
│   └── .env
├── frontend/       # Angular Standalone
│   ├── src/
│   ├── angular.json
│   └── package.json
└── database/
    ├── ddl/
    └── seeds/
```

---

## 4. Configuração do Banco de Dados (PostgreSQL)

### 4.1. Instalação

```bash
sudo apt update
sudo apt install postgresql postgresql-contrib
```

Verificar se o serviço está ativo:

```bash
sudo systemctl status postgresql
```

---

### 4.2. Criação do banco e usuário

Acessar o PostgreSQL como administrador:

```bash
sudo -u postgres psql
```

Criar banco e usuário da aplicação:

```sql
CREATE DATABASE sigcon;
CREATE USER sigcon_app WITH PASSWORD 'senha_forte';
GRANT ALL PRIVILEGES ON DATABASE sigcon TO sigcon_app;
```

Sair:

```sql
\q
```

---

### 4.3. Execução do DDL

Conectar como usuário da aplicação:

```bash
psql -h localhost -U sigcon_app -d sigcon
```

Executar os scripts DDL **na ordem numérica**:

```bash
psql -h localhost -U sigcon_app -d sigcon -f database/ddl/001_schema.sql
psql -h localhost -U sigcon_app -d sigcon -f database/ddl/002_tabelas.sql
...
```

> **Observação importante**
> A modelagem utiliza **foreign keys rígidas**. Dados devem ser inseridos respeitando a ordem:
> `orgao → unidade_organizacional → usuario → ciclo_pca → demanda`.

---

## 5. Configuração do Backend (Laravel)

### 5.1. Acessar o diretório correto

Todos os comandos `php artisan` **devem ser executados no diretório onde existe o arquivo `artisan`**:

```bash
cd backend
```

---

### 5.2. Instalação das dependências

```bash
composer install
```

---

### 5.3. Configuração do `.env`

Arquivo `backend/.env`:

```env
DB_CONNECTION=pgsql
DB_HOST=127.0.0.1
DB_PORT=5432
DB_DATABASE=sigcon
DB_USERNAME=sigcon_app
DB_PASSWORD=senha_forte
```

---

### 5.4. Extensão obrigatória do PHP (PostgreSQL)

**Este passo é crítico.**
Sem ele, o Laravel não consegue sequer iniciar a conexão com o banco.

Verificar:

```bash
php -m | grep pgsql
```

Resultado esperado:

```
pdo_pgsql
pgsql
```

Se não aparecer, instalar:

```bash
sudo apt install php-pgsql
```

Depois, reiniciar o backend:

```bash
php artisan serve
```

---

### 5.5. Limpeza de cache do Laravel

Sempre que alterar `.env`:

```bash
php artisan config:clear
php artisan config:cache
```

---

### 5.6. Controller de Demandas (integração real)

O endpoint **não deve usar dados mockados**.

Exemplo correto:

```php
use App\Models\Demanda;

public function index(): JsonResponse
{
    return response()->json(
        Demanda::select(
            'id_demanda',
            'objeto',
            'status',
            'valor_estimado'
        )->orderBy('id_demanda')->get()
    );
}
```

---

## 6. Configuração do Frontend (Angular)

### 6.1. Instalação

```bash
cd frontend
npm install
```

---

### 6.2. Arquitetura adotada

* Angular Standalone (sem `NgModule`)
* SSR/Vite ativo
* Providers centralizados em `app.config.ts`

---

### 6.3. Configuração obrigatória de providers

Arquivo `src/app/app.config.ts`:

```ts
import { ApplicationConfig } from '@angular/core';
import { provideRouter } from '@angular/router';
import { provideHttpClient, withFetch } from '@angular/common/http';
import { routes } from './app.routes';

export const appConfig: ApplicationConfig = {
  providers: [
    provideRouter(routes),
    provideHttpClient(withFetch())
  ]
};
```

> **Regra de ouro**
> Não declarar `HttpClient` nem `Router` em componentes ou rotas lazy.

---

### 6.4. Inicialização da aplicação

Arquivo `src/main.ts`:

```ts
bootstrapApplication(AppComponent, appConfig);
```

---

### 6.5. DTO e Service

Modelo (`Demanda`):

```ts
export interface Demanda {
  id_demanda: number;
  objeto: string;
  status: string;
  valor_estimado: number | null;
}
```

Service:

```ts
listarDemandas(): Observable<Demanda[]> {
  return this.http.get<Demanda[]>('/api/v1/demandas');
}
```

---

### 6.6. Template defensivo

Uso obrigatório de `*ngIf` para evitar erros de renderização:

```html
<table *ngIf="demandas.length > 0">
  <tr *ngFor="let d of demandas">
    ...
  </tr>
</table>
```

---

## 7. Teste de Integração (Prova de Funcionamento)

### 7.1. Teste no banco

```sql
SELECT * FROM demanda;
```

---

### 7.2. Teste da API

```
http://localhost:8000/api/v1/demandas
```

---

### 7.3. Teste no frontend

```
http://localhost:4200/pca
```

Alterações feitas diretamente no PostgreSQL **devem refletir imediatamente** na API e no frontend.

---

## 8. Problemas comuns e soluções

| Problema                        | Causa                              | Solução                        |
| ------------------------------- | ---------------------------------- | ------------------------------ |
| `NullInjectorError: HttpClient` | Provider fora do ApplicationConfig | Centralizar em `app.config.ts` |
| `artisan not found`             | Diretório errado                   | Entrar na pasta do backend     |
| `NO QUERIES EXECUTED`           | `php-pgsql` ausente                | Instalar extensão              |
| Violação de FK                  | Dados mestres inexistentes         | Inserir dados na ordem correta |

---

## 9. Status ao final desta documentação

Ao concluir todos os passos acima, o desenvolvedor terá:

* Ambiente local totalmente funcional;
* Integração real com PostgreSQL;
* Backend Laravel operando sem mocks;
* Frontend Angular consumindo dados reais;
* Base pronta para implementar fluxo de status, justificativas e governança CGPAR.

---

## 10. Próximo passo do projeto

➡️ **Fase 3.3 – Fluxo de Vida da Demanda**
Implementação de:

* alteração de status,
* justificativa obrigatória,
* histórico automático,
* validação prática das regras CGPAR.

---
