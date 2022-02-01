# Red

O código parte de uma url inicial, lê o conteúdo de uma página, busca todos os links dos arquivos para baixar, grava localmente e vai para a próxima página.

Pelo menos para mim, o ponto que brilha no código é a facilidade de analisar o documento e recuperar as informações desejadas. O trecho:

```red
links: parse thePage [
    collect [
        some [
            to "learn-more" to "/" keep to "^""]]]
```

1. thePage é a página lida, então `parse thePage` irá analisar o documento conforme as regras informadas no bloco.

2. `collect` irá retornar um bloco (array) com as informações que casarem no parser

3. `some` executará o bloco até até o final do texto (existem outras opções que não interessam no momento)

4. `to "learn-more"`irá mover o ponteiro para a posição onde encontrar o texto pela primeira vez (analisei o fonte da página antes para obter esta informação)

5. `to "/"`, partindo da posição atual, move o ponteiro até encontrar a primeira barra (que é o início do link )

6. `keep` é utilizado para recolher as informações desejadas pelo `collect`. No caso irá recolher o conteúdo da posição inicial até encontrar uma aspa.

7. Repete o bloco, reiniciando o passo 4 até que o ponteiro chegue ao final do texto, coletando todos os links. 

Ok, poderia ser feito utilizando ER (expressões regulares), mas como ficaria a legibilidade

O segundo parser procura a ocorrencia de `Previous Page` depois coloca o ponteiro após (`thru`) a primeira ocorrência de `href=''` e copia o texto até encontrar a primeira aspa para a variável `page`. Ok. temos o nome da pŕoxima para a ler e buscar os linka para baixar os arquivos.

```red
parse thePage [to "Previous Page" thru "href=^"" copy page to "^""]
```







Sé é rápido? **Muito** mais rápido do que ficar clicando para baixar e salvar os arquivo desejados. Sem contar que a gente ainda aprende algumas coisas interessante
