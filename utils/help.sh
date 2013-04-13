#!/bin/bash
function help {
	if [[ $1 ]]; then
		extended_help $1
		exit $EX_SUCCESS
	fi
printf "hom${bldblu}s${txtdef}hick uses git in concert with symlinks to track your precious dotfiles.
It is a bash stand-in for the original homesick by technicalpickles.

 Usage: homesick [options] TASK

 Tasks:
  homesick clone URI..               # Clone URI as a castle for homesick
  homesick generate PATH..           # Generate a castle repo
  homesick list                      # List cloned castles
  homesick check [CASTLE..]          # Check a castle for updates
  homesick refresh [DAYS] [CASTLE..] # Check if a castle needs refreshing
  homesick pull [CASTLE..]           # Update a castle
  homesick symlink [CASTLE..]        # Symlinks all dotfiles from a castle
  homesick track CASTLE FILE..       # Add a file to a castle
  homesick help [TASK]               # Show usage of a task

 Aliases:
  link    # Alias to symlink
  updates # Alias to check

 Runtime options:
   -q, [--quiet]    # Suppress status output
   -s, [--skip]     # Skip files that already exist
   -f, [--force]    # Overwrite files that already exist
   -b, [--batch]    # Batch-mode: Skip interactive prompts / Choose the default

 Note:
  To check, refresh, pull or symlink all your castles
  simply omit the CASTLE argument

"
}

function help_err {
	extended_help $1
	exit $EX_USAGE
}

function extended_help {
	case $1 in
		clone)    printf "Usage:\n  homesick clone URL.."               ;;
		generate) printf "Usage:\n  homesick generate PATH.."           ;;
		list)     printf "Usage:\n  homesick list"                      ;;
		check)    printf "Usage:\n  homesick check [CASTLE..]"          ;;
    updates)  printf "Usage:\n  homesick updates [CASTLE..]"        ;;
    refresh)  printf "Usage:\n  homesick refresh [DAYS] [CASTLE..]" ;;
		pull)     printf "Usage:\n  homesick pull [CASTLE..]"           ;;
		symlink)  printf "Usage:\n  homesick symlink [CASTLE..]"        ;;
    link)     printf "Usage:\n  homesick link [CASTLE..]"           ;;
		track)    printf "Usage:\n  homesick track CASTLE FILE.."       ;;
		help)     printf "Usage:\n  homesick help [TASK]"               ;;
		*)    help  ;;
		esac
	printf "\n\n"
}
