# Aplicação Todolist

Este é um aplicativo Todolist desenvolvido em Spring Boot, proporcionando uma maneira simples e eficiente de gerenciar suas tarefas diárias. A aplicação permite a criação de usuários, registro de tarefas, alteração e exclusão de tarefas, bem como a visualização de tarefas associadas a um usuário específico.

## Requisitos

Certifique-se de ter as seguintes ferramentas instaladas em sua máquina:

- Java JDK 8 ou superior
- Maven
- IDE (como IntelliJ IDEA ou Eclipse)

## Configuração

1. **Clone o repositório:**

    ```bash
    git clone https://seu-repositorio.git
    ```

2. **Abra o projeto em sua IDE.**

3. **Configure as propriedades do banco de dados no arquivo `application.properties`:**

    ```properties
    spring.datasource.url=jdbc:h2:mem:testdb
    spring.datasource.driverClassName=org.h2.Driver
    spring.datasource.username=sa
    spring.datasource.password=password
    spring.jpa.database-platform=org.hibernate.dialect.H2Dialect
    ```

## Executando o Aplicativo

Execute o aplicativo Spring Boot a partir da classe principal `TodoListApplication` ou use o seguinte comando Maven:

```bash
mvn spring-boot:run
```

O aplicativo estará disponível em `http://localhost:8080`.

## Endpoints da API

1. **Criar Usuário**

   - **URL**: `/users/`
   - **Método**: `POST`
   - **Corpo da Requisição**:

     ```json
     {
       "username": "nomeusuario",
       "name": "Nome do Usuário",
       "password": "senha123"
     }
     ```

2. **Criar Tarefa**

   - **URL**: `/tasks/`
   - **Método**: `POST`
   - **Corpo da Requisição**:

     ```json
     {
       "title": "Título da Tarefa",
       "description": "Descrição da Tarefa",
       "startAt": "2023-10-16T08:00:00",
       "endAt": "2023-10-16T12:00:00"
     }
     ```

3. **Listar Tarefas**

   - **URL**: `/tasks/`
   - **Método**: `GET`

4. **Atualizar Tarefa**

   - **URL**: `/tasks/{id}`
   - **Método**: `PUT`
   - **Corpo da Requisição**:

     ```json
     {
       "title": "Novo Título",
       "description": "Nova Descrição",
       "startAt": "2023-10-16T10:00:00",
       "endAt": "2023-10-16T14:00:00"
     }
     ```

5. **Deletar Tarefa**

   - **URL**: `/tasks/{id}`
   - **Método**: `DELETE`

## Filtro de Autenticação

A aplicação utiliza um filtro de autenticação para as solicitações relacionadas às tarefas. As credenciais do usuário são verificadas através de autenticação básica (`Authorization: Basic`). Certifique-se de fornecer as credenciais corretas ao acessar os endpoints protegidos.

## Tratamento de Exceções

A aplicação possui um controlador de exceções para lidar com casos em que uma requisição é malformada (`HttpMessageNotReadableException`). Isso garante uma resposta apropriada em caso de erro.

## Contribuindo

Sinta-se à vontade para contribuir para o desenvolvimento deste projeto. Abra uma issue para relatar problemas ou sugira melhorias.

## Licença

Este projeto está licenciado sob a [Licença MIT](LICENSE).
