import std/db_sqlite, strutils, os, zippy/ziparchives

let sDir = "../data/"
let theDb = open(absolutePath("../iconpack.db"), "", "", "")

theDb.exec(sql"Drop table if exists iconpack;")

theDb.exec(sql"""
    CREATE TABLE iconpack (
    Id     INTEGER PRIMARY KEY,
    Grupo  VARCHAR(50) NOT NULL,
    Nome   VARCHAR(50) NOT NULL,
    Image  BLOB);

    CREATE INDEX "porGrupos" ON "iconpack" ("grupo");
    CREATE INDEX "porNome" ON "iconpack" ("nome ");

    """)


theDb.exec(sql"BEGIN")

for f in walkFiles(sDir & "*.zip"):
    let fn = f.rsplit("/")[^1]
    let p = fn.find("-")
    let gr = fn[0 ..< p]
    echo f
    let zipContent = openZipArchive(f)
    for path in zipContent.walkFiles:
        if path.endsWith(".txt"):
            continue
        let contents = zipContent.extractFile(path)
        var insertStmt = theDb.prepare("INSERT INTO iconpack (Grupo, Nome,Image) VALUES (?,?,?)")
        insertStmt.bindParams(gr, path, contents)
        let bres = theDb.tryExec(insertStmt)
        doAssert(bres)
        finalize(insertStmt)

theDb.exec(sql"COMMIT")
echo "Feito!"
