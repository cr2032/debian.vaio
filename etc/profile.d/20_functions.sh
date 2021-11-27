## function
### date [YYYY-MM-DD HH:mm:SS]
now() {
    date '+%F %T'
}

### mkdir + cd into di
mkcd() {
    mkdir -p -- "$1"
    cd -P -- "$1"
}

### git add + commit -m (arg+date+time) + push
gogit() {
    stamp="$1 $(now)"
    git add .
    git commit . -m "$stamp"
    git push
    echo "> > >  STAMP = $stamp"
}

add-to-path() {
    export PATH=$1:$PATH
    echo -e "${IYL}$1 ${WHT}added to PATH!"
}

trash() {
    mv -i $1 /trash/
}

### find (name) /
locate() {
    find / -name "$1"
}

colorgrid() {
    iter=16
    while [ $iter -lt 52 ]; do
        second=$(($iter + 36))
        third=$(($second + 36))
        four=$(($third + 36))
        five=$(($four + 36))
        six=$(($five + 36))
        seven=$(($six + 36))
        if [ $seven -gt 250 ]; then seven=$(($seven - 251)); fi

        echo -en "\033[38;5;$(echo $iter)m█ "
        printf "%03d" $iter
        echo -en "   \033[38;5;$(echo $second)m█ "
        printf "%03d" $second
        echo -en "   \033[38;5;$(echo $third)m█ "
        printf "%03d" $third
        echo -en "   \033[38;5;$(echo $four)m█ "
        printf "%03d" $four
        echo -en "   \033[38;5;$(echo $five)m█ "
        printf "%03d" $five
        echo -en "   \033[38;5;$(echo $six)m█ "
        printf "%03d" $six
        echo -en "   \033[38;5;$(echo $seven)m█ "
        printf "%03d" $seven

        iter=$(($iter + 1))
        printf '\r\n'
    done
}
