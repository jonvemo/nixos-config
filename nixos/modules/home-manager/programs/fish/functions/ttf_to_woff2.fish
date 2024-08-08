#!/usr/bin/env fish

# Nombre de la carpeta para guardar los archivos comprimidos
set FOLDER fonts

# Crea la carpeta si no existe
mkdir -p $FOLDER

# Encuentra todos los archivos en la carpeta actual con la extensión .ttff
for FILE in *.ttf
    # Aplica woff2_compress al archivo
    woff2_compress "$FILE"

    # Cambia la extensión del archivo a .woff2
    set FILE_COMPRESSED (string replace ".ttf" ".woff2" -- $FILE)

    # Mueve el archivo comprimido a la carpeta destino
    mv "$FILE_COMPRESSED" $FOLDER
end
