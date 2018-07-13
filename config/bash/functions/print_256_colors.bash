#!/usr/bin/env bash

function print_256_colors() {
 for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done
}

function print_8bit_color() {
 for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done


