#!/bin/bash

# use this to debug the path of the current script
#SCRIPT_PATH=$(dirname $0)
#echo $SCRIPT_PATH

source $SCRIPT_PATH/alias.base.sh
# copy the current branc to the clipboard
alias ccb='git rev-parse --abbrev-ref HEAD | clipcopy'
alias vi='nvim'
alias tailf='tail -n 100 -f'

ghprs() {
  local limit="${1:-50}"

  gh search prs \
    --author @me \
    --state open \
    --limit "$limit" \
    --json repository,number,title,url \
  | jq -r '.[] | "\(.repository.nameWithOwner)\t\(.number)\t\(.title)\t\(.url)"' \
  | while IFS=$'\t' read -r repo number title prurl; do
      printf "\n%s#%s  %s\n%s\n" "$repo" "$number" "$title" "$prurl"

      # --- Checks rollup (state + failed check links) ---
      gh pr view "$number" -R "$repo" --json statusCheckRollup \
      | jq -r '
          def concl: (.conclusion // .state // "UNKNOWN");

          (
            [ .statusCheckRollup[]? | concl ] as $all
            | ($all | map(select(.=="SUCCESS")) | length) as $ok
            | ($all | map(select(.=="FAILURE" or .=="ERROR" or .=="CANCELLED" or .=="TIMED_OUT")) | length) as $bad
            | "checks: \($ok)/\($all|length) success, \($bad) failing"
          ),

          (
            .statusCheckRollup[]?
            | select(.name == "currents-bot")
            | "currents-bot(check): " + concl
              + (if .detailsUrl then "  " + .detailsUrl else "" end)
          ) // "currents-bot(check): (not found)",

          (
            .statusCheckRollup[]?
            | select(concl=="FAILURE" or concl=="ERROR" or concl=="CANCELLED" or concl=="TIMED_OUT")
            | select(.detailsUrl)
            | "  FAIL: " + .name + "  " + .detailsUrl
          )' || true

      # --- Conversation-tab currents links (from --comments output) ---
      echo "currents-bot(conversation links):"

      # Take the last comment "block" that mentions currents/currents-bot, then extract URLs
      # gh separates comment entries with blank lines; we treat blank-line-separated paragraphs as records.
      local urls
      urls="$(
        gh pr view "$number" -R "$repo" --comments 2>/dev/null \
        | awk 'BEGIN{RS=""; ORS="\n\n"} /currents-bot|currents/i {last=$0} END{print last}' \
        | grep -Eo 'https?://[^ )\]>"]+' \
        | awk '{print "  " $0}'
      )"

      if [[ -n "$urls" ]]; then
        echo "$urls"
      else
        echo "  (no currents links found in the latest currents-related comment)"
      fi
    done
}

alias prstat='ghprs'
