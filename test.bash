#!/bin/bash 
# SPDX-FileCopyrightText: 2025 shoma Takatori
# SPDX-License-Identifire: BSD-3-Clause

ng () {
        echo ${1}行目が違うよ
	res=1
}

res=0

### NORMAL INPUT ###
out=$(seq 1 10 | ./prime_number)
[ "${out}" = "2 3 5 7" ] || ng "$LINENO"

### STRANGE INPUT ###
out=$(echo あ| ./prime_number)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./prime_number)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
