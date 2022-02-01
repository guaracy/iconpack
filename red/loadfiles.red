Red []
;; leitura dos pacotes de icones de
;; https://flaticons.net/free-icon-packs

home: https://flaticons.net/
page: "free-icon-packs"
forever [
    thePage: read rejoin [home page]
    links: parse thePage [collect [some [to "learn-more" to "/" keep to "^""]]]
    foreach link links [
        fname: rejoin [last split link "/" ".zip"]
        sfname: rejoin [https://flaticons.net/images/packs/flaticons.net-  fname]
        write/binary to file! rejoin ["../data/" fname] read/binary sfname
        print fname
    ]
    parse thePage [to "Previous Page" thru "href=^"" copy page to "^""]
    if integer? attempt [to integer! last split page "-"][
        continue
    ]
    break
]
print "Feito!"
