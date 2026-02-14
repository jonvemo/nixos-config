#!/usr/bin/env fish

function ytv
    yt-dlp -f 'bestvideo[height<=1080][vcodec^=av01]+bestaudio[acodec=opus]/bestvideo[height<=1080][vcodec^=vp9]+bestaudio[acodec=opus]' \
        --merge-output-format webm \
        -o "$HOME/Videos/Music/%(uploader)s/%(title)s.%(ext)s" \
        $argv
end
