#!/usr/bin/env fish

# Formatos de entrada y salida
set INPUT_FORMATS png jpeg jpg
set OUTPUT_FORMAT webp

# Nombre de la carpeta para guardar los archivos convertidos
set FOLDER converted_webp

# Crea la carpeta si no existe
mkdir -p $FOLDER

# Encuentra todos los archivos en la carpeta actual con las extensiones de entrada
for FORMAT in $INPUT_FORMATS

    # Encuentra todos los archivos en la carpeta actual con la extensión de entrada
    for FILE in *.$FORMAT

        # Cambia la extensión del archivo al formato de salida
        set FILE_CONVERTED (string replace ".$FORMAT" ".$OUTPUT_FORMAT" -- $FILE)

        ffmpeg -i "$FILE" $FILE_CONVERTED

        mv "$FILE_CONVERTED" $FOLDER
    end

end
