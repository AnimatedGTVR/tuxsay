#!/usr/bin/env bash

rainbow=false

if [ "$1" = "lolcat" ] || [ "$1" = "--lolcat" ] || [ "$1" = "rainbow" ] || [ "$1" = "--rainbow" ]; then
  rainbow=true
  shift
fi

roll=$((RANDOM % 1000))

jokes=(
  "Why did the Linux user cross the road? To compile the other side."
  "I use Arch btw. That is not a joke. It is a warning."
  "Wayland behaved today. Mark the calendar."
  "The package manager giveth, and the package manager taketh away."
  "Your terminal is not broken. It is just thinking in Bash."
  "A clean home directory is a sign of a broken workflow."
  "Linux users do not restart. They investigate."
  "The kernel saw what you did and chose silence."
  "One does not simply leave Vim."
  "The real desktop environment was the dotfiles we broke along the way."
  "Your rice is beautiful, but your Downloads folder is a war crime."
  "Permission denied. Confidence also denied."
  "Systemd is watching. Do not act suspicious."
  "PipeWire is working. Be afraid."
  "X11 walked so Wayland could argue."
  "Your shell history knows too much."
  "Fastfetch opened. Opinion detected."
  "You typed sudo and became a different person."
  "This terminal session has main character energy."
  "The bug is not gone. It is hiding."
  "If it works, do not update it. If it breaks, update everything."
  "Linux is free if your time has no value."
  "Your dotfiles are one bad symlink away from becoming modern art."
  "The command failed successfully."
  "Bash saw your script and filed a complaint."
  "Your system is stable because you have not touched it today."
  "The logs are long because the truth is painful."
  "Neovim users do not quit. They remap escape."
  "There are two types of Linux users: those who backup and those who will."
  "The terminal is just Discord for your computer."
  "Your PATH is a mystery novel."
  "The package was not found because it is emotionally unavailable."
  "Your config is valid in spirit."
  "The desktop is minimal. The problems are not."
  "You installed one package and adopted twelve dependencies."
  "The penguin forgives you. The compiler does not."
  "Every Linux setup is one update away from a lore arc."
  "You did not break Linux. You unlocked advanced mode."
  "The man page has the answer, but at what cost?"
  "Your window manager has fewer features and more personality."
  "If the terminal is transparent, the errors are aesthetic."
  "The build failed because the vibes were off."
  "Your aliases are powerful and deeply concerning."
  "CMake has entered the chat. Everyone has left the chat."
  "The script works on my machine, which is technically a production environment."
  "No GUI. Only vibes."
  "The file permissions are not wrong. They are dramatic."
  "Your config has been customized beyond recognition."
  "The shell did exactly what you asked, unfortunately."
  "Congratulations. You have automated the problem."
  "Your system is not bloated. It is emotionally layered."
  "The Linux desktop is ready, except for the part you need."
  "You are one chmod away from learning."
  "The terminal blinked. It knows."
  "The repo has not been updated since 2016. Perfect."
  "You installed a theme and became a screenshot account."
  "The logs are not errors. They are computer poetry."
  "Your boot time is fast because your problems load later."
  "Every config file is a diary entry with syntax."
  "The dependency tree has roots in ancient times."
  "Your shell prompt has more features than the app."
  "The update was small. The consequences were not."
  "The command line is just texting your computer with consequences."
  "This script is held together by hope and executable permissions."
  "Your package manager is disappointed but willing."
  "The cursor is blinking because it is judging you."
  "A tiling window manager is just Tetris for productivity."
  "Your rice is clean. Your bashrc is not."
  "The kernel panic was not panic. It was expression."
  "You have entered the sudo zone."
  "Your computer accepted the command. That was the first mistake."
  "The bug report contains the words sometimes and somehow. Perfect."
  "This is not a crash. It is a surprise exit."
  "Your terminal theme says cyberpunk. Your error says missing semicolon."
  "The package installed. The problem evolved."
  "The config is readable if you already know what it means."
  "The shell is powerful because it trusts you too much."
  "Today is a good day to not run random curl scripts."
  "Your machine has uptime. Your patience does not."
  "The Linux mascot is cute because the errors are not."
  "The process is sleeping. Same."
  "You did not install bloat. You installed possibilities."
  "The terminal does not care about your feelings, but Tux might."
  "Your distro is not unstable. It is adventurous."
  "The build system has chosen violence."
  "One missing library. Twelve hours gone."
  "Your system is custom. Your problems are artisanal."
  "The config file looked simple. That was bait."
  "You fixed the issue by changing nothing. Classic."
  "The command ran. That is all we know."
  "The terminal is where confidence goes to be tested."
  "Your shell theme is faster than your package mirror."
  "The error message is technically English."
  "The cursor waits. The user hesitates."
  "Your wallpaper is doing most of the rice."
  "The compiler is not mad. It is disappointed."
  "The script has no bugs, only secret features."
  "The best Linux tool is the one you wrote at 2 AM."
  "The real problem was permissions. It is always permissions."
  "Your system has detected excessive confidence."
  "The file exists, but emotionally it does not."
  "The terminal is a mirror. Unfortunately."
)

motivation=(
  "Keep building. Tiny scripts become real tools."
  "Your setup does not need to be perfect. It needs to be yours."
  "One bug fixed is one step closer to greatness."
  "Even the kernel started as somebody's side project."
  "Do the funny thing. Linux was built by people doing the funny thing."
  "Your rice may be cursed, but your spirit is stable."
  "Small tools are how big projects begin."
  "Break things carefully, then learn loudly."
  "A working prototype beats a perfect idea."
  "You are allowed to make dumb tools. Dumb tools become legendary."
  "Every great developer has a folder full of experiments."
  "If it makes you laugh and teaches you something, it was worth making."
  "Keep your scripts small, your backups fresh, and your terminal weird."
  "Build the tool you wish already existed."
  "A bad first version is better than a perfect never-version."
  "Curiosity is a valid development strategy."
  "The best projects start with this would be funny."
  "You do not need permission to make cool stuff."
  "Finish the tiny version first. Then make it powerful."
  "Linux rewards people who poke around."
  "You are not wasting time. You are collecting ideas."
  "Your weirdest project might become your favorite one."
  "Make it work. Make it clean. Then make it funny."
  "A simple script with personality is better than a boring masterpiece."
  "Keep going. Future you will steal code from current you."
  "Good tools feel like inside jokes with your computer."
  "One clean function can save an entire evening."
  "Do not wait for motivation. Make a silly command and start."
  "The best dev environment is the one that makes you want to build."
  "Every command you understand makes Linux less scary."
  "Do the small fix. It counts."
  "You are closer than you think, unless CMake is involved."
  "A project does not need to be serious to be useful."
  "Your terminal can be both productive and stupid."
  "Make the thing. Name it badly. Improve it later."
  "The difference between a joke and a tool is usually one install script."
  "Keep your ideas moving. Stale ideas become forgotten tabs."
  "You can make Linux feel like home."
  "The best rice is readable, fast, and yours."
  "Today is a good day to ship something tiny."
)

tux() {
cat << "EOF"
      \
       \
        .--.
       |o_o |
       |:_/ |
      //   \ \
     (|     | )
    /'\_   _/`\
    \___)=(___/
EOF
}

say_box() {
  message="$1"
  width=${#message}
  line=$(printf '%*s' "$width" '' | tr ' ' '_')
  bottom=$(printf '%*s' "$width" '' | tr ' ' '-')

  echo " $line "
  echo "< $message >"
  echo " $bottom "
  tux
}

print_output() {
  if [ "$rainbow" = true ] && command -v lolcat >/dev/null 2>&1; then
    lolcat
  else
    cat
  fi
}

if [ "$#" -gt 0 ]; then
  say_box "$*" | print_output
  exit 0
fi

if [ "$roll" -eq 0 ]; then
  say_box "fuck you" | print_output
else
  all=("${jokes[@]}" "${motivation[@]}")
  message="${all[$((RANDOM % ${#all[@]}))]}"
  say_box "$message" | print_output
fi
