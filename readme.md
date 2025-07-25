# Imersão DevOps - Alura Google Cloud

Este projeto é uma API desenvolvida com FastAPI para gerenciar alunos, cursos e matrículas em uma instituição de ensino.

## Pré-requisitos

- [Python 3.10 ou superior instalado](https://www.python.org/downloads/)
- [Git](https://git-scm.com/downloads)
- [Docker](https://www.docker.com/get-started/)

## Passos para subir o projeto

1. **Faça o download do repositório:**
   [Clique aqui para realizar o download](https://github.com/guilhermeonrails/imersao-devops/archive/refs/heads/main.zip)

2. **Crie um ambiente virtual:**
   ```sh
   python3 -m venv ./ambientevirtual
   ```

3. **Ative o ambiente virtual:**
   - No Linux/Mac:
     ```sh
     source ambientevirtual/bin/activate
     ```
   - No Windows:
     ```sh
     ambientevirtual\Scripts\activate
     ```
     > **Nota:** Se estiver usando o PowerShell, o comando correto é `.\ambientevirtual\Scripts\activate`.

4. **Instale as dependências:**
   ```sh
   pip install -r requirements.txt
   ```

5. **Execute a aplicação:**
   ```sh
   uvicorn app:app --reload
   ```
  
 Para testar a aplicação de outro computador na sua rede, siga os passos abaixo:
   ```sh
	uvicorn app:app --reload --host 0.0.0.0
 
	O parâmetro --host 0.0.0.0 faz com que o servidor escute em todas as interfaces de rede, tornando-o acessível pelo IP da máquina na rede localmente com o end.
	
	http://192.168.16.222:8000
   ```


    
6. **Acesse a documentação interativa:**

   Abra o navegador e acesse:  
   [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs)

   Aqui você pode testar todos os endpoints da API de forma interativa.

---
### Passos para subir o projeto
7. **Adicionando o Container Docker:**

Criar o arquivo DockerFile 
**DockerFile**
ele deve conter as orientação da instação
alpine é a imagem mais leve armazenada do docker
 ```sh
FROM python:3.13.5-alpine3.22 

WORKDIR /app

COPY requirements.txt requirements.txt

EXPOSE 8000

RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

COPY . /app

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]



   ```
   ---
8. **Adicionando o arquivo dockerignore:**
para especificar o que não deve ter no Container 
por exemplo cache e abiente virtual
.dockerignore  
    ``` 
	venv
__pycache__
      ```
 
   
9. **Criando a imagem Docker:**
   
   ```  
 docker build -t api-aula-alura-test-fcm .

 ```  
	O . no final do comando indica o diretório atual como o contexto de build. Assumindo que seu Dockerfile está no diretório C:\Users\administrator\Desktop\IMERSAO, este comando funcionará.
   
   ```  
docker run -p 8000:8000 api-aula-alura-test-fcm
 ```     
#### Passos para automazar com composer   
10. **Automatizando o Container:**
   Criar o arquivo docker-compose.yml 
**docker-compose.yml** a identação é importante
   ```  
services:
  api:
    build: .
    container_name: imersao_api
    ports:
      - "8000:8000"
    volumes:
      # Monta o diretório atual no container para desenvolvimento.
      # Isso permite que as alterações no código sejam refletidas automaticamente
      # (graças ao --reload no Dockerfile) e que o banco de dados SQLite
      # (escola.db) seja salvo no seu computador.
      - .:/app
 ```     
## Estrutura do Projeto

- `app.py`: Arquivo principal da aplicação FastAPI.
- `models.py`: Modelos do banco de dados (SQLAlchemy).
- `schemas.py`: Schemas de validação (Pydantic).
- `database.py`: Configuração do banco de dados SQLite.
- `routers/`: Diretório com os arquivos de rotas (alunos, cursos, matrículas).
- `requirements.txt`: Lista de dependências do projeto.

---

- O banco de dados SQLite será criado automaticamente como `escola.db` na primeira execução.
- Para reiniciar o banco, basta apagar o arquivo `escola.db` (isso apagará todos os dados).

---
Claro! Que tal você criar um Dockerfile para uma aplicação diferente?

Exercício:

    Escolha uma aplicação simples em outra linguagem de programação, como Node.js ou Ruby on Rails.

    Crie um Dockerfile que:
        Utilize a imagem oficial da linguagem escolhida.
        Instale as dependências necessárias a partir de um arquivo de requisitos (como package.json para Node.js ou Gemfile para Ruby).
        Exponha a porta correta que a aplicação utiliza.
        Execute a aplicação.

    Teste o contêiner localmente e verifique se a aplicação está acessível através do navegador.

Esse exercício vai te ajudar a entender como adaptar o que você aprendeu com a API escolar para diferentes contextos e linguagens! Se precisar de ajuda, estou aqui! 😊
Exercício: Criando um Docker Compose para uma Aplicação Web com Banco de Dados

    Objetivo: Criar um arquivo docker-compose.yml para uma aplicação web simples que utiliza um banco de dados PostgreSQL.

    Requisitos:
        A aplicação deve ser uma API simples em Python (pode usar FastAPI ou Flask).
        O banco de dados deve ser um contêiner PostgreSQL.
        As variáveis de ambiente para o banco de dados devem ser configuradas no docker-compose.yml.
        O volume deve ser utilizado para persistir os dados do banco de dados.
        A aplicação deve ser acessível na porta 8000.

    Passos:
        Crie um diretório para o projeto e dentro dele, crie um arquivo docker-compose.yml.
        Defina os serviços necessários: um para a aplicação e outro para o banco de dados.
        Configure as variáveis de ambiente para o banco de dados, como POSTGRES_USER, POSTGRES_PASSWORD e POSTGRES_DB.
        Utilize um volume para o banco de dados para que os dados não sejam perdidos quando o contêiner for reiniciado.
        Teste a aplicação para garantir que ela se conecta corretamente ao banco de dados.

Esse exercício vai te ajudar a praticar a criação de um ambiente de desenvolvimento usando Docker Compose e a entender melhor como os serviços interagem entre si. Boa sorte!

Claro! Que tal fazer um exercício onde você cria uma nova aplicação containerizada utilizando o Cloud Run? Aqui está a sugestão:

Exercício: Deploy de uma Aplicação Simples no Cloud Run

    Crie uma nova aplicação: Desenvolva uma aplicação simples em Python utilizando Flask que retorne uma mensagem "Hello, World!" quando acessada.

    Crie um Dockerfile: Escreva um Dockerfile para a sua aplicação que defina como a imagem do contêiner deve ser construída.

    Construa a imagem localmente: Utilize o Docker para construir a imagem da sua aplicação localmente e teste-a.

    Envie a imagem para o Artifact Registry: Após testar localmente, envie a imagem da sua aplicação para o Artifact Registry do Google Cloud.

    Realize o deploy no Cloud Run: Utilize o comando gcloud run deploy para fazer o deploy da sua aplicação no Cloud Run.

    Teste a aplicação: Após o deploy, acesse a URL pública gerada pelo Cloud Run e verifique se a mensagem "Hello, World!" é exibida corretamente.

Esse exercício ajudará você a praticar todos os passos que aprendemos na aula, desde a criação da aplicação até o deploy na nuvem. Boa sorte!
#   I m e r s a o A l u r a A p i F C M  
 