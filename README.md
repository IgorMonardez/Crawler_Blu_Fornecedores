# Web crawler 
#### Igor de Paula Siqueira Monárdez

Para rodar o projeto é necessário primeiramente clonar o arquivo do [github](https://github.com/IgorMonardez/Crawler_Blu_Fornecedores).

Após o código clonado voce entra na pasta onde o repositório foi clonado.

A seguir rode os seguintes códigos:



> ##### Desenvolvimento
> ```bash
> $ docker-compose build
> ```
> ```bash
> $ docker-compose run web bundle exec rake db:create db:migrate
> ```
> ```bash
> $ docker-compose up --build
> ```
> ##### Para rodar o crawler basta estar na root ou digitar:
> > localhost:3000/crawler/execute
> 
> ##### Para visualizar os fornecedores:
> >localhost:3000/fornecedores
> 
> ##### Para visualizar os segmentos:
> >localhost:3000/segmentos
> 
> ##### Para visualizar as regiões:
> >localhost:3000/regioes
> 
> ##### Para os filtros basta seguir o seguinte esboço:
> >localhost:3000/<nome_tabela>?<nome_coluna>=<valordesejado>
> 
> ##### Para os filtros com mais de uma coluna basta seguir o seguinte esboço:
> >localhost:3000/<nome_tabela>?<nome_coluna>=<valor_desejado>&<nome_coluna>=<valor_desejado>
> 

> ##### Teste
> ```bash
> $ docker-compose build
> ```
> 
> ```bash
> $ docker-compose run web bundle exec rspec
> ```
> 