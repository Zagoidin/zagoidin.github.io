st=$(cat /home/z/wp/.st)

case "$st" in
	"1")
	echo "2" > /home/z/wp/.st
	;;
	"2")
	echo "3" > /home/z/wp/.st
	;;
	"3")
	echo "4" > /home/z/wp/.st
	;;
	"4")
	echo "1" > /home/z/wp/.st
	;;
	*)
	echo "1" > /home/z/wp/.st
	;;
esac

swaybg -i "/home/z/wp/wp$st.png"
