# Nim

É uma linguagem que acho bem interessante. Com uma sintaxe parecida com Python, porém compilada e estaticamente tipada (mas com diversas facilidades). Uma das coisas que considero interessantes nessas linguagens é que forçando a indentação (coisa que qualquer programador básico já utiliza, tirando J, APL e algumas outras linguagens) elimina um monde de sujeira que outras linguagens necessitam que o programador coloque. `begin...end` no Pascal e outras ou `{...}` em C e outras.

Também tem um bom número de bibliotecas, gera código para ser compilado por C/C++ ou JS. A biblioteca utilizada foi implementada em Nim e, como o código é compilado, para percorrer os 225 arquivos compactados e gerar os 3682 registro com o ícone levou aproximadamente 1,2 segundos no meu computador.  Eu iria levar mais do que isto apenas para descompactar os 255 arquivos.

O código para abrir um arquivo compactado seria assim:

```nim
import zippy/ziparchives

let zipContent = openZipArchive("path/file.zip")
for path in zipContent.walkFiles:
    echo path
```

Quer coisa mais simples? `nim c -r fonte.nim` compila e executa. Apesar de ser compilada, existe também um REPL para a linguagem.

Trabalhar com sqlite também foi muito simples. A primeira versão da inserção do registro deu erro na inclusão da imagem. Mas a informação estava no [manual](https://nim-lang.org/docs/db_sqlite.html#basic-usage-storing-binary-data-example) e foi basicamente copiar e colar.

```nim
let contents = zipContent.extractFile(path)
var insertStmt = theDb.prepare("INSERT INTO iconpack (Grupo, Nome,Image) VALUES (?,?,?)")
insertStmt.bindParams(gr, path, contents)
let bres = theDb.tryExec(insertStmt)
doAssert(bres)
insertStmt.finalize
```

Note que, apesar de não ser uma linguagem orientada para objeto, a constração `insertStmt.finalize` é igual ao objectPacla como `objeto.Free`.
