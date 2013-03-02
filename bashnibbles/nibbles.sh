#!/bin/bash
# BashNibbles: An implementation of Nibbles in bash shell script.
# Use the vi cursor keys (hjkl) to control a snake moving around
# the screen. Pick up the #s; avoid crashing into your own tail.
# Terminal-independant (uses tput).
#
# About as good as the TI-83 version is. More challenging. For
# an even more challenging game, use a smaller xterm.
# Adam Sampson, ats@offog.org

wormdie () {
    tput clear
    echo "Adam's BashNibbles"
    echo
    echo $1
    echo Your score: `cat ~/.nibblesscore`
    echo >>~/.nibbleshs `cat ~/.nibblesscore` - `whoami` - `date`
    sort -r -n ~/.nibbleshs | head -10 >~/.nibbleshs2
    mv -f ~/.nibbleshs2 ~/.nibbleshs
    echo
    echo "High scores:"
    cat ~/.nibbleshs
    echo
    echo "Press any key to finish"
    echo >~/.nibblesstop
}

bgprocess () {
    tput clear
    xs=`tput cols`
    ys=`tput lines`
    l=1
    ox=0
    oy=0
    x=$((($xs / 2)))
    y=$((($ys / 2)))
    y=10
    tx=$((($RANDOM % $xs)))
    ty=$((($RANDOM % $ys)))
    echo "ox=0; oy=0" >~/.nibblestail
    while : ; do
	if [ "$tx" = "$x" -a "$ty" = "$y" ] ; then
	    l=$((($l + 1)))
	    tx=$((($RANDOM % $xs)))
	    ty=$((($RANDOM % $ys)))
	fi
	if [ "$x" = "-1" -o "$x" = "$xs" -o "$y" = "-1" -o "$y" = "$ys" ] ; then
	    wormdie "Hit the wall"
	    return
	fi
	if grep -q "ox=$x ; oy=$y" ~/.nibblestail ; then
	    wormdie "Hit your own tail"
	    return
	fi
	if [ -f ~/.nibblesquit ] ; then
	    wormdie "Quit while you were ahead"
	    return
	fi
	tput cup $ty $tx ; echo -n "#"
	tput cup $y $x ; echo -n "o"
	tput cup $oy $ox ; echo -n " "
	echo "ox=$x ; oy=$y" >>~/.nibblestail
	tail -$l ~/.nibblestail >~/.nibblestail2
	mv -f ~/.nibblestail2 ~/.nibblestail
	eval $(head -1 ~/.nibblestail)
	tput cup 0 0 ; echo -n "Score: " $l
	x=$((($x + `cat ~/.nibblesdx`)))
	y=$((($y + `cat ~/.nibblesdy`)))
	echo $l >~/.nibblesscore
    done
}

setdir () {
    echo $1 >~/.nibblesdx
    echo $2 >~/.nibblesdy
}

nibbles() {
    bgprocess &
    stty -icanon min 1 time 0 -echo
    setdir 1 0
    key=none
    while [ ! -f ~/.nibblesstop ] ; do
	key=`dd bs=1 count=1 2>/dev/null`
	[ "$key" = "h" ] && setdir -1 0
	[ "$key" = "j" ] && setdir 0 1
	[ "$key" = "k" ] && setdir 0 -1
	[ "$key" = "l" ] && setdir 1 0
	[ "$key" = "q" ] && echo >~/.nibblesquit
    done
    stty sane
    rm -f ~/.nibbleskeypress ~/.nibblesstop ~/.nibblesquit ~/.nibblesscore
}

nibbles
