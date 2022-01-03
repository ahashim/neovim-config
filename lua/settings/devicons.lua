local icons = require("nvim-web-devicons")
local theme = require("settings.onedark").get()

icons.setup {
   override = {
      c = {
         icon = "",
         color = theme('blue'),
         name = "c",
      },
      css = {
         icon = "",
         color = theme('blue'),
         name = "css",
      },
      deb = {
         icon = "",
         color = theme('cyan'),
         name = "deb",
      },
      Dockerfile = {
         icon = "",
         color = theme('cyan'),
         name = "Dockerfile",
      },
      html = {
         icon = "",
         color = theme('orange'),
         name = "html",
      },
      jpeg = {
         icon = "",
         color = theme('dark_purple'),
         name = "jpeg",
      },
      jpg = {
         icon = "",
         color = theme('dark_purple'),
         name = "jpg",
      },
      js = {
         icon = "",
         color = theme('dark_yellow'),
         name = "js",
      },
      kt = {
         icon = "󱈙",
         color = theme('orange'),
         name = "kt",
      },
      lock = {
         icon = "",
         color = theme('red'),
         name = "lock",
      },
      lua = {
         icon = "",
         color = theme('blue'),
         name = "lua",
      },
      mp3 = {
         icon = "",
         color = theme('white'),
         name = "mp3",
      },
      mp4 = {
         icon = "",
         color = theme('white'),
         name = "mp4",
      },
      out = {
         icon = "",
         color = theme('white'),
         name = "out",
      },
      png = {
         icon = "",
         color = theme('dark_purple'),
         name = "png",
      },
      py = {
         icon = "",
         color = theme('cyan'),
         name = "py",
      },
      ["robots.txt"] = {
         icon = "ﮧ",
         color = theme('red'),
         name = "robots",
      },
      toml = {
         icon = "",
         color = theme('blue'),
         name = "toml",
      },
      ts = {
         icon = "ﯤ",
         color = theme('cyan'),
         name = "ts",
      },
      ttf = {
         icon = "",
         color = theme('white'),
         name = "TrueTypeFont",
      },
      rb = {
         icon = "",
         color = theme('pink'),
         name = "rb",
      },
      rpm = {
         icon = "",
         color = theme('orange'),
         name = "rpm",
      },
      vue = {
         icon = "﵂",
         color = theme('green'),
         name = "vue",
      },
      woff = {
         icon = "",
         color = theme('white'),
         name = "WebOpenFontFormat",
      },
      woff2 = {
         icon = "",
         color = theme('white'),
         name = "WebOpenFontFormat2",
      },
      xz = {
         icon = "",
         color = theme('dark_yellow'),
         name = "xz",
      },
      zip = {
         icon = "",
         color = theme('dark_yellow'),
         name = "zip",
      },
   },
}
