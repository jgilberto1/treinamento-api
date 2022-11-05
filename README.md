# Automação API - Drogasil

Projeto de automação de testes para as APIs da Drogasil

## Instalação do ambiente

* Instalar a IDE que desejar, recomendado Visual Studio Code. as execuções podem ser realizadas no terminal do Vs Code ou
  se recomenda utilizar o Console do Cmder.
  Baixe em: https://github.com/cmderdev/cmder/releases/download/v1.3.2/cmder.zip 

* Instalar ruby
  Baixe em: http://rubyinstaller.org/downloads/

* Instalar as dependencias do projeto que estão no gemfile
  gem install bundle no terminal ou cmder

## Uso

Antes da execução, é necessário informar um usuário válido cadastrado na plataforma em features/support/data/users.yml (Utilizar o modelo especificado)

Para executar algum cenário / suíte:

```sh
cucumber -t <TAGS> -p <AMBIENTE> 
```

```sh
cucumber -t <TAG> -p default
```

## Desenvolvimento

**Para criar um cenário:**

- Criar o cenário na estrutura `features\specs\<API_NAME>\endpoint.feature`
- Criar os steps na estrutura `features\steps\<API_NAME>\endpoint_steps.rb`
- Criar os services na estrutura `features\services\<API_NAME>\endpoint.rb`
- Criar a abstração dos page_objects na estrutura `features\support\spec_helper`

**Boas práticas:**

- Seguir o [Padrão de escrita dos Gherkins]
- Os cenários devem ser escritos em português e todo o desenvolvimento em inglês
- Os steps devem fazer apenas o que se propõem, nada a mais, nada a menos
- Prezar pelo reaproveitamento dos steps
- Lógica que serão reaproveitadas em N lugares, devem estar na estrutura `features\support\commons\commons`

**Parâmetros:**

- -e AMBIENTE="-p ???": ambiente onde serão executados os cenários, esse parâmetro é obrigatório. (_Exemplo: "-p des"_)
- -e TAGS="-t @???": tags dos cenários que quer executar, esse parâmetro é obrigatório. (_Exemplo: "-p @post_adicionar_item"_)
- -e PROFILES="-p ??? -p ...": parâmetros para execução customizada, esse parâmetro é opcional e por padrão considera "-p default".

**Relatórios e evidências:**

- reports\evidences\AAAAMMDD - evidências geradas de cada execução por dia e hora
- reports\features_report.html - report cucumber em html
- reports\features_report.json - report cucumber em json para ser utilizado em outros modelos de report







© Copyright João Gilberto. Todos os direitos reservados.
