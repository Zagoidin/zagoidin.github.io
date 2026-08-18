function fish_prompt
	bash ~/mygit/statusbar.bash
	string join "" -- (set_color -o green) " :> " (set_color --reset)
end
function fish_greeting
	echo -e "\033[36mThere must be Fetch soon. IG =D"
end
