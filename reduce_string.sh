#!/bin/bash

function reduce_string()
{
    string="$1"
    max_len="$2"
    ellipsis="…"
    result="$1"

    string_len=${#string}
    excess_chars=$((string_len - max_len))
    if [ $excess_chars -gt 0 ]; then
        half_excess_chars=$((excess_chars / 2))
        mid_index=$((string_len / 2))
        left_str="${string:0:$((mid_index - half_excess_chars - 1))}"
        right_str="${string:$((mid_index + excess_chars - half_excess_chars + ellipsis_len - half_ellipsis_len)):string_len}"
        result="$left_str$ellipsis$right_str"
    fi
    echo -n "$result"
}

# reduce_string "The quick brown fox jumps over" 10 "-"

