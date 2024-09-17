#!/usr/bin/env fish

# Formatos de entrada y salida
set INPUT_FORMAT jpg
set OUTPUT_FORMAT webp

# Nombre de la carpeta para guardar los archivos convertidos
set FOLDER converted_jpg_webp

# Crea la carpeta si no existe
mkdir -p $FOLDER

# Encuentra todos los archivos en la carpeta actual con la extensión de entrada
for FILE in *.$INPUT_FORMAT

    # Cambia la extensión del archivo al formato de salida
    set FILE_CONVERTED (string replace ".$INPUT_FORMAT" ".$OUTPUT_FORMAT" -- $FILE)

    ffmpeg -i "$FILE" $FILE_CONVERTED

    mv "$FILE_CONVERTED" $FOLDER
end
