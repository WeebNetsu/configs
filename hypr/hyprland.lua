--[[
todo:
scrolling is wack yo
bind = $mainMod, R, submap, resize -> resize werk met muis maar nog nie met die
bind = $mainMod, J, layoutmsg, togglesplit # dwindle -> idk what this is, so skipped

windowrule {
    # Fix some dragging issues with XWayland
    name = fix-xwayland-drags
    match:class = ^$
    match:title = ^$
    match:xwayland = true
    match:float = true
    match:fullscreen = false
    match:pin = false

    no_focus = true
}
Skipping whole section, if we get dragging issues, add it
]]


local terminal = "xfce4-terminal"
local fileManager = "nemo"
local menu = "rofi -show drun -theme ~/.config/rofi/launchers/type-2/style-1.rasi"

hl.config({
    monitor = {
        "DP-1, 1920x1080, 0x0, 1",
        "DP-2, 1280x1024, 1920x0, 1",
        "HDMI-A-1, 1920x1080, 3200x0, 1"
    },
    hl.monitor({
        output = "DP-1",
        mode = "1920x1080@60",
        position = "0x0",
        scale = 1,
    }),
    hl.monitor({
        output = "DP-2",
        mode = "1280x1024@60",
        position = "1920x0",
        scale = 1,
    }),
    hl.monitor({
        output = "HDMI-A-1",
        mode = "1920x1080@60",
        position = "3200x0",
        scale = 1,
    }),
    general = {
        gaps_in          = 5,
        gaps_out         = 7,
        border_size      = 1,
        col              = {
            active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing    = false,
        layout           = "scrolling"
    },

    decoration = {
        rounding = 20,
        rounding_power = 1,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)"
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696
        }
    },

    animations = {
        enabled = true,
        bezier = {
            "easeOutQuint,   0.23, 1,    0.32, 1",
            "easeInOutCubic, 0.65, 0.05, 0.36, 1",
            "linear,         0,    0,    1,    1",
            "almostLinear,   0.5,  0.5,  0.75, 1",
            "quick,          0.15, 0,    0.1,  1"
        },
        animation = {
            "global,        1,     10,    default",
            "border,        1,     5.39,  easeOutQuint",
            "windows,       1,     4.79,  easeOutQuint",
            "windowsIn,     1,     4.1,   easeOutQuint, popin 87%",
            "windowsOut,    1,     1.49,  linear,       popin 87%",
            "fadeIn,        1,     1.73,  almostLinear",
            "fadeOut,       1,     1.46,  almostLinear",
            "fade,          1,     3.03,  quick",
            "layers,        1,     3.81,  easeOutQuint",
            "layersIn,      1,     4,     easeOutQuint, fade",
            "layersOut,     1,     1.5,   linear,       fade",
            "fadeLayersIn,  1,     1.79,  almostLinear",
            "fadeLayersOut, 1,     1.39,  almostLinear",
            "workspaces,    1,     1.94,  almostLinear, fade",
            "workspacesIn,  1,     1.21,  almostLinear, fade",
            "workspacesOut, 1,     1.94,  almostLinear, fade",
            "zoomFactor,    1,     7,     quick"
        }
    },

    dwindle = {
        preserve_split = true
    },

    master = {
        new_status = "master"
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true
    },

    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "compose:ralt",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false
        }
    },

    device = {
        {
            name = "epic-mouse-v1",
            sensitivity = -0.5
        }
    },

    cursor = {
        no_hardware_cursors = false,
        enable_hyprcursor = true
    },

    scrolling = {
        column_width = 0.5,
        wrap_focus = true,
        direction = "right"
    }
})

-- ENVIRONMENT VARIABLES
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- GESTURES
-- hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- -------------------
-- ---- AUTOSTART ----
-- -------------------
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar & hyprpaper")

    --  die bliksemse keyring!!
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets,pkcs11,ssh")
end)

-- ---------------------
-- ---- KEYBINDINGS ----
-- ---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
closeWindowBind:set_enabled(true)
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("brave"))
-- Color picker
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("subl"))
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + X", hl.dsp.layout("fit active"))
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.layout("colresize -0.5"))

-- Take screenshots
hl.bind("SHIFT + code:118",
    hl.dsp.exec_cmd(
        [[grim -g "$(slurp)" - | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/satty-$(date +%Y%m%d-%H%M%S).png]])
)
hl.bind("SHIFT + F12",
    hl.dsp.exec_cmd(
        [[grim -g "$(slurp)" - | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/satty-$(date +%Y%m%d-%H%M%S).png]])
)
hl.bind(mainMod .. " + SHIFT + F12",
    hl.dsp.exec_cmd(
        [[grim -g "$(slurp)" - | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/satty-$(date +%Y%m%d-%H%M%S).png]])
)

-- Volume Control
hl.bind(mainMod .. " + SHIFT + Insert",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%+")
)
hl.bind(mainMod .. " + SHIFT + Delete",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-")
)

-- Media Player Controls
-- insert
hl.bind(mainMod .. " + code:118",
    hl.dsp.exec_cmd("playerctl play-pause")
)
-- page up
hl.bind(mainMod .. " + code:112",
    hl.dsp.exec_cmd("playerctl next")
)
-- page down
hl.bind(mainMod .. " + code:117",
    hl.dsp.exec_cmd("playerctl previous")
)

-- move windows around
hl.bind(mainMod .. " + SHIFT + left",
    hl.dsp.window.move({ direction = "left" })
)
hl.bind(mainMod .. " + SHIFT + right",
    hl.dsp.window.move({ direction = "right" })
)
hl.bind(mainMod .. " + SHIFT + up",
    hl.dsp.window.move({ direction = "up" })
)
hl.bind(mainMod .. " + SHIFT + down",
    hl.dsp.window.move({ direction = "down" })
)

-- move to next monitor
hl.bind(mainMod .. " + SHIFT + period",
    hl.dsp.workspace.move({ monitor = 1 })
)

hl.bind(mainMod .. " + SHIFT + comma",
    hl.dsp.workspace.move({ monitor = -1 })
)

-- focus windows
hl.bind(mainMod .. " + left",
    hl.dsp.layout("focus l")
)
hl.bind(mainMod .. " + right",
    hl.dsp.layout("focus r")
)
hl.bind(mainMod .. " + up",
    hl.dsp.layout("focus u")
)
hl.bind(mainMod .. " + down",
    hl.dsp.layout("focus d")
)

hl.bind(mainMod .. " + mouse_up",
    hl.dsp.layout("focus l")
)

hl.bind(mainMod .. " + mouse_down",
    hl.dsp.layout("focus r")
)

-- Define resize mode
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
    hl.bind("right",
        hl.dsp.window.resize({ x = 40, y = 0, relative = true }),
        { repeating = true }
    )

    hl.bind("left",
        hl.dsp.window.resize({ x = -40, y = 0, relative = true }),
        { repeating = true }
    )

    hl.bind("up",
        hl.dsp.window.resize({ x = 0, y = -40, relative = true }),
        { repeating = true }
    )

    hl.bind("down",
        hl.dsp.window.resize({ x = 0, y = 40, relative = true }),
        { repeating = true }
    )

    hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- super special magic workspace
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S",
    hl.dsp.window.move({
        workspace = "special:magic",
        silent = true
    })
)
hl.bind(mainMod .. " + ALT + S",
    hl.dsp.window.move({
        workspace = "e+0",
        silent = true
    })
)

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
