#!/bin/bash

__enhancd::custom::ghq()
{
    local root dir

    if ! __enhancd::utils::has "ghq"; then
        __enhancd::utils::die \
            "ghq: not found\n"
        return 1
    fi

    ghq root 2>/dev/null \
        | read root
    {
        cat "$ENHANCD_DIR/enhancd.log" \
            | grep "$root" \
            | __enhancd::utils::reverse
        ghq list 2>/dev/null
    } \
        | grep -v "^$root$" \
        | sed 's#'"$root/"'##' \
        | __enhancd::utils::unique \
        | __enhancd::narrow "$@" \
        | __enhancd::filter \
        | read dir

    if [[ -n $dir ]]; then
        __enhancd::cd "$root/$dir"
        return $?
    fi
}
