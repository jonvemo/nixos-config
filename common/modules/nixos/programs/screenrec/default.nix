{ pkgs, ... }:

let
  custom-wl-screenrec = pkgs.wl-screenrec.override { 
    ffmpeg_6 = pkgs.ffmpeg; 
  };

  screenrec = pkgs.writeShellScriptBin "screenrec" ''
    if pgrep -x "wl-screenrec" > /dev/null; then
      notify-send -t 1500 "🎥 Recording" "⚠️ A recording is already active" --icon=dialog-warning
      exit 1
    fi

    DRI_DEV="/dev/dri/renderD128"
    DISPLAY="eDP-1"
    MONITOR="bluez_output.25:05:29:B6:14:CF.monitor"
    RES="1280x720"
    FPS_MAX="30"
    V_BITRATE="1 MB"
    A_BITRATE="16kB"

    REC_DIR="$HOME/Videos/Recs"
    TIMESTAMP=$(date "+%Y-%m-%d, %H%M%S")
    FINAL_FILE="$REC_DIR/$TIMESTAMP.mp4"
    
    mkdir -p "$REC_DIR"

    notify-send -t 1500 "🎥 Recording" "Starting capture..." --icon=media-record

    ${custom-wl-screenrec}/bin/wl-screenrec \
        --dri-device "$DRI_DEV" \
        --output "$DISPLAY" \
        --codec hevc \
        --low-power off \
        --encode-resolution "$RES" \
        --max-fps "$FPS_MAX" \
        --bitrate "$V_BITRATE" \
        --audio \
        --audio-backend pulse \
        --audio-device "$MONITOR" \
        --audio-codec opus \
        --audio-bitrate "$A_BITRATE" \
        --filename "$FINAL_FILE"

    if [ -s "$FINAL_FILE" ]; then
        notify-send '🎥 Recording' "✅ Video saved: $TIMESTAMP.mp4" --icon=media-floppy
    else
        notify-send '🎥 Recording' "❌ Error saving video" --icon=dialog-error
    fi
  '';
in
{
  environment.systemPackages = [ screenrec ];
}
