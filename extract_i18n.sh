#!/bin/bash
find . -name '*.mo' -delete
mkdir -p unicorecmsepicqueen/locale

pot-create -o unicorecmsepicqueen/locale/unicorecmsepicqueen.pot unicorecmsepicqueen/

declare -a arr=("eng_GB")

for lang in "${arr[@]}"
do
    mkdir -p "unicorecmsepicqueen/locale/""$lang""/LC_MESSAGES"

    if [ ! -f "unicorecmsepicqueen/locale/""$lang""/LC_MESSAGES/unicorecmsepicqueen.po" ]; then
        msginit -l $lang -i unicorecmsepicqueen/locale/unicorecmsepicqueen.pot -o unicorecmsepicqueen/locale/$lang/LC_MESSAGES/unicorecmsepicqueen.po
    fi

    msgmerge --update unicorecmsepicqueen/locale/$lang/LC_MESSAGES/unicorecmsepicqueen.po unicorecmsepicqueen/locale/unicorecmsepicqueen.pot
    msgfmt unicorecmsepicqueen/locale/$lang/LC_MESSAGES/*.po -o unicorecmsepicqueen/locale/$lang/LC_MESSAGES/unicorecmsepicqueen.mo
done
