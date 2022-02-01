# iconpack

O site [flaticons](https://flaticons.net/) possui uma coleção de ícones (256x256) e que podem ser utilizados em projetos web comerciais ou não. Não pode vender os ícones.

> You are allowed to use the icons royalty free in your personal and commercial web projects.
> You are not allowed to sell them.

## Tarefas

O **primeiro** problema é que são 255 arquivos zipados contendo os ícones de cada conjunto. Seria um clique para abrir a página, um clique para baixar, um clique para confirmar e um clique para retornar para a página principal (1020 cliques do mouse). Para automatizar o processo, fiz um programinha em [Red](https://www.red-lang.org/) que ficou com 22 linhas (705 caracteres contando espaçoes em branco e comentários). Maiores informações no README.

O **segundo** problema seria extrair os arquivos dos 255 pacotes. Poderia automatizar o processo mas teria que colocar em pastas separadas para não descaracterizar a individualidade dos pacotes. Ou ficaria com os ícones todos misturados. Uma solução seria criar um banco de dados onde ficasse armazenado o nome do conjunto, o nome do ícone e a imagem. Assim podeia selecionar os ícones como `nome like "%home%"` ou `conjunto = arrows`. Resolvi automatizar o processo e usei [Nim](https://nim-lang.org/) para a tarefa. Ficou um programa com 40 linhas (1089 caracteres contando com os espaços em branco). Ele vai criar a base de dados em sqlite, com o grupo, nome e imagem. Maiores informações no README.

A **terceira** parte  foi desenvolver um programa para o desktop em [Lazarus](https://www.lazarus-ide.org/) para a visualização dos ícones. Maiores informações no README. Por enquanto ele não faz nada além de ver e cópia o ícone para o clipboard. Buscar, colorização e redimensionamento serão as próximas etapas.

## Conclusão

Poderia ter feito tudo em Lazarus? Poderia mas achei que a primeira etapa em Red ficou bem interessante e mostra algumas facilidades da linguagem. A maior é a utilização do parser para selecionar o texto (links) desejado (poderia ter sido feito com expressões regulares em outra linguagem). Acho que foi muito mais simples do que fazer em freePascal (e olha que o meu conhecimento em Red não é lá tão grande). A segunda parte feita em Nim mostra um pouco das facilidades que a linguagem proporciona. 

Poderia ter feito tudo em Red? Meio complicado pois as bibliotecas para acesso aos arquivos compactados ainda não está desenvolvida bem como o acesso ao banco de dados. Teria muito trabalho para fazer. 

Poderia ter feito tudo em Nim? A primeira e segunda parte não teria problema mas o desenvolvimento da GUI seria bem mais complicado já que não chega aos pés do Lazarus.

Daria para dizer que foram utilizadas três linguagens diferentes, cada uma fazendo a sua tarea de forma bastante adequada.