{ pkgs, ... }:

{
  programs.waybar.enable = true;

  # TODO: Convert to non-text based config
  xdg.configFile."waybar/config".text = ''
{
    "layer": "bottom",
    "margin": "5 5 0 5",
    "height": 30,

    "modules-left": ["hyprland/workspaces"],
    "modules-center": ["clock"],
    "modules-right": ["pulseaudio"],
    "clock": {
        "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>",
        "format": "{:%a, %d %b, %I:%M %p}"
    },
    "pulseaudio": {
        "format": "{volume}% {icon} {format_source}",
        "format-bluetooth": "{volume}% {icon} {format_source}",
        "format-bluetooth-muted": " {icon} {format_source}",
        "format-muted": "0% {icon} ",
        "format-source": "{volume}% ",
        "format-source-muted": "",
        "format-icons": {
            "headphone": "",
            "hands-free": "",
            "headset": "",
            "phone": "",
            "portable": "",
            "car": "",
            "default": ["", "", ""]
        },
        "on-click": "hyprctl dispatch exec [floating] pavucontrol",
        "min-length": 13,
    },
}
  '';

  # TODO: Convert to non-text based config
  xdg.configFile."waybar/style.css".text = ''
* {
    border: none;
    border-radius: 0;
    font-family: Liberation Mono;
    min-height: 20px;
}

window#waybar {
    background: transparent;
}

window#waybar.hidden {
    opacity: 0.2;
}

#workspaces {
    margin-right: 8px;
    border-radius: 10px;
    transition: all 0.5s ease-out;
    background: rgba(56, 60, 74, .3);
}

#workspaces button {
    transition: none;
    color: #7c818c;
    background: transparent;
    padding: 5px;
    font-size: 18px;
}

#workspaces button:hover {
    transition: none;
    box-shadow: inherit;
    text-shadow: inherit;
    border-radius: inherit;
    color: #383c4a;
    background: rgba(56, 60, 74, .3);
}

#workspaces button.focused,
#workspaces button.active {
    color: white;
}

#clock {
    padding-left: 8px;
    padding-right: 8px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: rgba(56, 60, 74, .3);
}

#pulseaudio {
    padding-left: 0;
    padding-right: 0;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: rgba(56, 60, 74, .3);
}

#pulseaudio.muted {
    background-color: #90b1b1;
    color: #2a5c45;
}
  '';
}