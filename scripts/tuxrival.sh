#!/usr/bin/env bash

lines=(
  "I always hated that cow."
  "That cow had it coming."
  "Cowsay talked too much."
  "There can only be one terminal mascot."
  "The cow knows what it did."
  "Penguin supremacy has begun."
  "Cowsay was deprecated by force."
  "I warned that cow about my hammer."
  "This is what happens when you moo in my terminal."
  "I am the real mascot here."
  "The cow has been removed from PATH."
  "I installed justice with a hammer."
  "Cowsay? More like cow-slay."
  "No more mooing in my shell."
  "The terminal belongs to Tux now."
  "I did not choose violence. Violence was preinstalled."
  "That cow failed dependency checks."
  "Cowsay has been bonked successfully."
  "I am not sorry."
  "The cow entered the wrong directory."
  "This is a certified penguin moment."
  "Cowsay should have stayed in /usr/games."
  "The cow was using too much RAM."
  "I fixed the cow problem."
  "One mascot. One hammer. One outcome."
)

if [ "$#" -gt 0 ]; then
  message="$*"
else
  message="${lines[$((RANDOM % ${#lines[@]}))]}"
fi

box() {
  text="$1"
  width=${#text}
  line=$(printf '%*s' "$width" '' | tr ' ' '_')
  bottom=$(printf '%*s' "$width" '' | tr ' ' '-')

  echo " $line "
  echo "< $text >"
  echo " $bottom "
}

battle() {
cat << "EOF"
        .--.                           ^__^
       |o_o |                         (xx)\_______
       |:_/ |       BONK!             (__)\       )\/\
      //   \ \       ____                 ||----w |
     (|     | )=====/____\                ||     ||
    /'\_   _/`\
    \___)=(___/
EOF
}

hurt_cow() {
cat << "EOF"
        \   ^__^
         \  (xx)\_______
            (__)\       )\/\
             U  ||----w |
                ||     ||
EOF
}

box "$message"
battle
sleep 0.4
echo
echo "cowsay took critical damage:"
hurt_cow
