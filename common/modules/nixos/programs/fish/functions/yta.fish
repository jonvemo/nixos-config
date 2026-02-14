#!/usr/bin/env fish

function yta
    yt-dlp -x --audio-format opus --audio-quality 0 \
        --embed-thumbnail --convert-thumbnails jpg \
        --ppa "ffmpeg: -c:v mjpeg -vf 'crop=ih:ih'" \
        --add-metadata \
        -o "$HOME/Music/%(uploader)s/%(title)s.%(ext)s" \
        $argv
end
