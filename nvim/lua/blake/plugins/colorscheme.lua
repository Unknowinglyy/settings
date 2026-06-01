return {
  -- NOTE: Rose pine
  {
    "rose-pine/neovim",
    name = "rose-pine",
    -- priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "main", -- auto, main, moon, or dawn
        dark_variant = "main", -- main, moon, or dawn
        dim_inactive_windows = false,
        -- disable_background = true,
        -- 	disable_nc_background = false,
        -- 	disable_float_background = false,
        -- extend_background_behind_borders = false,
        styles = {
          bold = true,
          italic = false,
          transparency = true,
        },
        highlight_groups = {
          ColorColumn = { bg = "#1C1C21" },
          Normal = { bg = "none" }, -- Main background remains transparent
          Pmenu = { bg = "", fg = "#e0def4" }, -- Completion menu background
          PmenuSel = { bg = "#4a465d", fg = "#f8f5f2" }, -- Highlighted completion item
          PmenuSbar = { bg = "#191724" }, -- Scrollbar background
          PmenuThumb = { bg = "#9ccfd8" }, -- Scrollbar thumb
        },
        enable = {
          terminal = false,
          legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
          migrations = true, -- Handle deprecated options automatically
        },
      })

      -- HACK: set this on the color you want to be persistent
      -- when quit and reopening nvim
      --vim.cmd("colorscheme rose-pine")
    end,
  },
  -- NOTE: Kanagwa
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = false },
        functionStyle = {},
        keywordStyle = { italic = false },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = {
            wave = {},
            dragon = {},
            all = {
              ui = {
                bg_gutter = "none",
                border = "rounded",
              },
            },
          },
        },
        overrides = function(colors) -- add/modify highlights
          local theme = colors.theme
          return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
            Pmenu = { fg = theme.ui.shade0, bg = "NONE", blend = vim.o.pumblend }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
            -- I don't like the blue visual selection color and think a light purple would be better for this colorscheme
            --colors.palette.lotusViolet4 is pretty good here
            --1st option: #625673
            --2nd option: #534962
            --3rd option: #3e364a
            --4th option: #443b66
            Visual = { bg = "#443b66" },
            -- default yank color also sucks
            IncSearch = { bg = colors.palette.waveAqua1, fg = "none" },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptBorder = { fg = theme.ui.special },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim },
            TelescopeResultsBorder = { fg = theme.ui.special },
            TelescopePreviewBorder = { fg = theme.ui.special },
          }
        end,
        theme = "wave", -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = "wave", -- try "dragon" !
        },
      })
    end,
  },
  -- NOTE : tokyonight
  {
    "folke/tokyonight.nvim",
    name = "folkeTokyonight",
    -- priority = 1000,
    config = function()
      local transparent = true
      local bg = "#011628"
      local bg_dark = "#011423"
      local bg_highlight = "#143652"
      local bg_search = "#0A64AC"
      local bg_visual = "#275378"
      local fg = "#CBE0F0"
      local fg_dark = "#B4D0E9"
      local fg_gutter = "#627E97"
      local border = "#547998"

      require("tokyonight").setup({
        style = "night",
        transparent = transparent,

        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          sidebars = transparent and "transparent" or "dark",
          floats = transparent and "transparent" or "dark",
        },
        on_colors = function(colors)
          colors.bg = transparent and colors.none or bg
          colors.bg_dark = transparent and colors.none or bg_dark
          colors.bg_float = transparent and colors.none or bg_dark
          colors.bg_highlight = bg_highlight
          colors.bg_popup = bg_dark
          colors.bg_search = bg_search
          colors.bg_sidebar = transparent and colors.none or bg_dark
          colors.bg_statusline = transparent and colors.none or bg_dark
          colors.bg_visual = bg_visual
          colors.border = border
          colors.fg = fg
          colors.fg_dark = fg_dark
          colors.fg_float = fg
          colors.fg_gutter = fg_gutter
          colors.fg_sidebar = fg_dark
        end,
      })
    end,
  },
  {
    "uhs-robert/oasis.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Styles: "night", "midnight", "abyss", "starlight", "desert", "sol", "canyon", "dune", "cactus", "mirage", "lagoon", "twilight", "rose"
      require("oasis").setup({
        style = "abyss", -- Primary style, default used when colorscheme is set to "oasis"
        dark_style = "auto", -- Applies to your primary style only: "auto" uses `style`. Or override with another dark theme (e.g., "abyss")
        light_style = "auto", -- Applies to your primary style only: "auto" uses `style`. Or override with another light theme (e.g., "dune")
        light_intensity = 3, -- Light background intensity (1-5): 1=subtle, 5=saturated
        use_legacy_comments = false, -- For "desert" style only, uses the loud skyblue comment color from desert.vim for a more retro experience
        themed_syntax = true, -- Uses the theme's primary color for statements/keywords. Set to false for the classic yellow syntax from desert.vim for a more retro experience

        -- Text styling - toggle individual styles
        styles = {
          bold = true, -- Enable bold text (keywords, functions, etc.)
          italic = false, -- Enable italics (comments, certain keywords)
          underline = true, -- Enable underlined text (matching words)
          undercurl = true, -- Enable undercurl for diagnostics/spelling
          strikethrough = true, -- Enable strikethrough text (deprecations)
        },

        -- Display options
        transparent = true, -- Set to true for transparent backgrounds (bye-bye theme backgrounds)
        terminal_colors = true, -- Apply Oasis colors to Neovim's built-in terminal

        -- Contrast controls (WCAG: AA = 4.5, AAA = 7.0)
        contrast = {
          -- Note: Light themes obey the targets below. All dark themes target 7.0 by default with only a couple of exceptions that dip to 6.5.
          min_ratio = 5.8, -- Clamp 4.5–7.0; target contrast for syntax/terminal colors. Increase for more contrast, decrease for more pop.
          force_aaa = false, -- When true, forces AAA (7.0) wherever possible; as a result some colors will appear muddy (bye bye non-primary colors).
        },

        palette_overrides = {}, -- Override colors in specific palettes
        highlight_overrides = {}, -- Override specific highlight groups
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "auto", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true, -- disables setting the background color.
        float = {
          transparent = true, -- enable transparent floating windows
          solid = false, -- use solid styling for floating windows, see |winborder|
        },
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false, -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = true, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" }, -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = { "bold" },
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = { "bold" },
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
            ok = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        auto_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      })
    end,
  },
  {
    "neanias/everforest-nvim",
    name = "everforest",
    config = function()
      require("everforest").setup({
        ---Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
        ---Default is "medium".
        background = "hard",
        ---How much of the background should be transparent. 2 will have more UI
        ---components be transparent (e.g. status line background)
        transparent_background_level = 2,
        ---Whether italics should be used for keywords and more.
        italics = false,
        ---Disable italic fonts for comments. Comments are in italics by default, set
        ---this to `true` to make them _not_ italic!
        disable_italic_comments = true,
        ---By default, the colour of the sign column background is the same as the as normal text
        ---background, but you can use a grey background by setting this to `"grey"`.
        sign_column_background = "none",
        ---The contrast of line numbers, indent lines, etc. Options are `"high"` or
        ---`"low"` (default).
        ui_contrast = "low",
        ---Dim inactive windows. Only works in Neovim. Can look a bit weird with Telescope.
        ---
        ---When this option is used in conjunction with show_eob set to `false`, the
        ---end of the buffer will only be hidden inside the active window. Inside
        ---inactive windows, the end of buffer filler characters will be visible in
        ---dimmed symbols. This is due to the way Vim and Neovim handle `EndOfBuffer`.
        dim_inactive_windows = false,
        ---Some plugins support highlighting error/warning/info/hint texts, by
        ---default these texts are only underlined, but you can use this option to
        ---also highlight the background of them.
        diagnostic_text_highlight = true,
        ---Which colour the diagnostic text should be. Options are `"grey"` or `"coloured"` (default)
        diagnostic_virtual_text = "coloured",
        ---Some plugins support highlighting error/warning/info/hint lines, but this
        ---feature is disabled by default in this colour scheme.
        diagnostic_line_highlight = false,
        ---By default, this color scheme won't colour the foreground of |spell|, instead
        ---colored under curls will be used. If you also want to colour the foreground,
        ---set this option to `true`.
        spell_foreground = false,
        ---Whether to show the EndOfBuffer highlight.
        show_eob = true,
        ---Style used to make floating windows stand out from other windows. `"bright"`
        ---makes the background of these windows lighter than |hl-Normal|, whereas
        ---`"dim"` makes it darker.
        ---
        ---Floating windows include for instance diagnostic pop-ups, scrollable
        ---documentation windows from completion engines, overlay windows from
        ---installers, etc.
        ---
        ---NB: This is only significant for dark backgrounds as the light palettes
        ---have the same colour for both values in the switch.
        float_style = "bright",
        ---Inlay hints are special markers that are displayed inline with the code to
        ---provide you with additional information. You can use this option to customize
        ---the background color of inlay hints.
        ---
        ---Options are `"none"` or `"dimmed"`.
        inlay_hints_background = "none",
        -- ---You can override specific highlights to use other groups or a hex colour.
        -- ---This function will be called with the highlights and colour palette tables.
        -- ---@param highlight_groups Highlights
        -- ---@param palette Palette
        -- on_highlights = function(highlight_groups, palette) end,
        -- ---You can override colours in the palette to use different hex colours.
        -- ---This function will be called once the base and background colours have
        -- ---been mixed on the palette.
        -- ---@param palette Palette
        -- colours_override = function(palette) end,
      })
    end,
  },
  {
    "ribru17/bamboo.nvim",
    name = "bamboo",
    config = function()
      -- change the color of the macro color for rust, bright pink doesn't look good there
      require("bamboo").setup({
        -- Main options --
        -- NOTE: to use the light theme, set `vim.o.background = 'light'`
        style = "vulgaris", -- Choose between 'vulgaris' (regular), 'multiplex' (greener), and 'light'
        toggle_style_key = nil, -- Keybind to toggle theme style. Leave it nil to disable it, or set it to a string, e.g. "<leader>ts"
        toggle_style_list = { "vulgaris", "multiplex" }, -- List of styles to toggle between
        transparent = true, -- Show/hide background
        dim_inactive = false, -- Dim inactive windows/buffers
        term_colors = true, -- Change terminal color as per the selected theme style
        ending_tildes = true, -- Show the end-of-buffer tildes. By default they are hidden
        cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

        -- Change code style ---
        -- Options are anything that can be passed to the `vim.api.nvim_set_hl` table
        -- You can also configure styles with a string, e.g. keywords = 'italic,bold'
        code_style = {
          comments = { italic = false },
          conditionals = { italic = false },
          keywords = {},
          functions = {},
          namespaces = { italic = false },
          parameters = { italic = false },
          strings = {},
          variables = {},
        },

        -- Lualine options --
        lualine = {
          transparent = true, -- lualine center bar transparency
        },

        -- Custom Highlights --
        colors = {}, -- Override default colors
        highlights = {}, -- Override highlight groups

        -- Plugins Config --
        diagnostics = {
          darker = true, -- darker colors for diagnostic
          undercurl = true, -- use undercurl instead of underline for diagnostics
          background = true, -- use background color for virtual text
        },
      })
    end,
  },
  {
    "everviolet/nvim",
    name = "evergarden",
    config = function()
      require("evergarden").setup({
        theme = {
          variant = "winter", -- 'winter'|'fall'|'spring'|'summer'
          accent = "black",
        },
        editor = {
          transparent_background = true,
          override_terminal = true,
          sign = { color = "none" },
          float = {
            color = "mantle",
            solid_border = false,
          },
          completion = {
            color = "surface0",
          },
        },
        style = {
          tabline = { "reverse" },
          search = { "reverse" },
          incsearch = { "reverse" },
          types = { "bold" },
          keyword = { "bold" },
          comment = {},
        },
        overrides = {},
        color_overrides = {},
      })
    end,
  },
  {
    "thesimonho/kanagawa-paper.nvim",
    name = "kanagawa-paper",
    config = function()
      require("kanagawa-paper").setup({
        -- enable undercurls for underlined text
        undercurl = true,
        -- transparent background
        transparent = true,
        -- highlight background for the left gutter
        gutter = false,
        -- background for diagnostic virtual text
        diag_background = true,
        -- dim inactive windows. Disabled when transparent
        dim_inactive = false,
        -- set colors for terminal buffers
        terminal_colors = true,
        -- cache highlights and colors for faster startup.
        -- see Cache section for more details.
        cache = true,

        styles = {
          -- style for comments
          comment = { italic = false },
          -- style for functions
          functions = { italic = false },
          -- style for keywords
          keyword = { italic = false, bold = true },
          -- style for statements
          statement = { italic = false, bold = false },
          -- style for types
          type = { italic = false, bold = true },
        },
        -- override default palette and theme colors
        colors = {
          palette = {},
          theme = {
            ink = {},
            canvas = {},
          },
        },
        -- adjust overall color balance for each theme [-1, 1]
        color_balance = {
          ink = { brightness = 0, saturation = 0 },
          canvas = { brightness = 0, saturation = 0 },
        },
        -- override highlight groups
        overrides = function(colors)
          return {}
        end,

        -- uses lazy.nvim, if installed, to automatically enable needed plugins
        auto_plugins = true,
        -- enable highlights for all plugins (disabled if using lazy.nvim)
        all_plugins = package.loaded.lazy == nil,
        -- manually enable/disable individual plugins.
        -- check the `groups/plugins` directory for the exact names
        plugins = {
          -- examples:
          -- rainbow_delimiters = true
          -- which_key = false
        },
      })
    end,
  },
  {
    "wtfox/jellybeans.nvim",
    name = "jellybeans",
    config = function()
      require("jellybeans").setup({
        transparent = true,
        italics = false,
        bold = true,
        flat_ui = true, -- toggles "flat UI" for pickers
        background = {
          dark = "jellybeans", -- default dark palette
          light = "jellybeans_light", -- default light palette
        },
        plugins = {
          all = false,
          auto = true, -- auto-detect installed plugins via lazy.nvim
        },
        on_highlights = function(highlights, colors) end,
        on_colors = function(colors) end,
      })
    end,
  },
  {
    "AvengeMedia/base46",
    lazy = false,
    opts = {
      transparency = true,
    },
  },
  {
    "HoNamDuong/hybrid.nvim",
    opts = {
      transparent = true,
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
        folds = false,
      },
    },
  },
}
