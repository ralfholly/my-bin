find "$@" -type f -exec bash -c "file {} | grep -q ELF && ls {}" \;
