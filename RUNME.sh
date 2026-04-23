#!/usr/bin/env bash
#(C)2019-2026 Pim Snel - https://github.com/mipmip/RUNME.sh
CMDS=(); DESC=(); NARGS=$#; ARG1=$1;make_command(){ CMDS+=($1);DESC+=("$2");};usage(){ printf "\nUsage: %s [command]\n\nCommands:\n" $0;line="              ";for ((i=0;i<=$((${#CMDS[*]}-1));i++));do printf "  %s %s ${DESC[$i]}\n" ${CMDS[$i]} "${line:${#CMDS[$i]}}";done;echo;};RUNME_DIR="$(cd "$(dirname "$0")" && pwd)";if [ -d "$RUNME_DIR/RUNME.d" ]; then for _f in "$RUNME_DIR/RUNME.d"/*.sh; do [ -f "$_f" ] && source "$_f"; done;fi;runme(){ if test $NARGS -eq 1; then eval "$ARG1"||usage;else usage;fi;}

##### PLACE YOUR COMMANDS BELOW #####


make_command "build" "Generate index.html from sites.yaml"
build(){
  command -v yq >/dev/null 2>&1 || { echo "Error: yq is required. Install with: nix-shell -p yq-go"; exit 1; }

  local yaml="$RUNME_DIR/sites.yaml"
  local output="$RUNME_DIR/index.html"

  local title
  title=$(yq '.site.title' "$yaml")
  local tagline
  tagline=$(yq '.site.tagline' "$yaml")
  local disclaimer
  disclaimer=$(yq '.site.disclaimer' "$yaml")

  local tiles=""
  local count
  count=$(yq '.services | length' "$yaml")

  for ((i=0; i<count; i++)); do
    local url short desc
    url=$(yq ".services[$i].url" "$yaml")
    short=$(yq ".services[$i].short" "$yaml")
    desc=$(yq ".services[$i].description" "$yaml")
    tiles+="      <a class=\"tile\" href=\"${url}\">"$'\n'
    tiles+="        <span class=\"short\">${short}</span>"$'\n'
    tiles+="        <span class=\"description\">${desc}</span>"$'\n'
    tiles+="      </a>"$'\n'
  done

  cat > "$output" << HTMLEOF
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${title}</title>
    <link rel="stylesheet" href="style.css">
    <script async src="https://umami.pimsnel.com/script.js" data-website-id="ee0c5e4c-1817-44ac-8b05-cdceaf5da358"></script>
  </head>
  <body>
    <header>
      <div class="logo-area">
        <svg width="64" height="64" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg">
          <defs>
            <linearGradient id="rainbow" x1="0%" y1="0%" x2="100%" y2="100%">
              <stop offset="0%" stop-color="#e40303"/>
              <stop offset="20%" stop-color="#ff8c00"/>
              <stop offset="40%" stop-color="#ffed00"/>
              <stop offset="60%" stop-color="#008026"/>
              <stop offset="80%" stop-color="#24408e"/>
              <stop offset="100%" stop-color="#732982"/>
            </linearGradient>
          </defs>
          <text x="50%" y="50%" dominant-baseline="central" text-anchor="middle"
                font-family="Georgia, 'Times New Roman', serif"
                font-size="56" font-weight="bold"
                fill="url(#rainbow)">&#955;</text>
        </svg>
        <h1><span class="wordmark-extra">Extra</span><span class="wordmark-nix">Nix</span></h1>
      </div>
      <p class="tagline">${tagline}</p>
    </header>
    <div class="tiles">
${tiles}    </div>
    <footer>
      <p>${disclaimer}</p>
    </footer>
    <script src="main.js"></script>
  </body>
</html>
HTMLEOF

  echo "Generated $output"
}


##### PLACE YOUR COMMANDS ABOVE #####

runme
