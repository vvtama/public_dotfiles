BLOCK_WIDTH = 1
SPACE = (' ' * 2).freeze

HEX_COLORS = {
  black:   "#263338", bold_black:   "#1e2b30",
  red:     "#dc312e", bold_red:     "#cb4a16",
  green:   "#859901", bold_green:   "#586d74",
  yellow:  "#b58900", bold_yellow:  "#657b82",
  blue:    "#268ad2", bold_blue:    "#839495",
  magenta: "#d33582", bold_magenta: "#6c6ec6",
  cyan:    "#2aa197", bold_cyan:    "#93a0a1",
  white:   "#eee8d5", bold_white:   "#fdf6e3",
}.freeze

RGB_COLORS = {
  black:   "38, 51, 56",  bold_black: "30, 43, 48",
  red:     "220, 49, 46", bold_red: "203, 74, 22",
  green:   "133, 153, 1", bold_green: "88, 109, 116",
  yellow:  "181, 137, 0", bold_yellow: "101, 123, 130",
  blue:    "38, 138, 210", bold_blue: "131, 148, 149",
  magenta: "211, 53, 130", bold_magenta: "108, 110, 198",
  cyan:    "42, 161, 151", bold_cyan: "147, 160, 161",
  white:   "238, 232, 213", bold_white: "253, 246, 227",
}.freeze

# use this as a reference of the colors order
TERMINAL_COLOR_NAMES = [
  :black,
  :red,
  :green,
  :yellow,
  :blue,
  :magenta,
  :cyan,
  :white,

  :bold_black,
  :bold_red,
  :bold_green,
  :bold_yellow,
  :bold_blue,
  :bold_magenta,
  :bold_cyan,
  :bold_white,
].freeze

TERMINAL_HUE = [
  :bold_black,
  :black,
  :bold_green,
  :bold_yellow,
  :bold_blue,
  :bold_cyan,
  :white,
  :bold_white,

  :red,
  :bold_red,
  :yellow,
  :green,
  :cyan,
  :blue,
  :bold_magenta,
  :magenta,
].freeze

COLOR_CODES = Hash.new(9).update(
  black:   0, bold_black:   60,
  red:     1, bold_red:     61,
  green:   2, bold_green:   62,
  yellow:  3, bold_yellow:  63,
  blue:    4, bold_blue:    64,
  magenta: 5, bold_magenta: 65,
  cyan:    6, bold_cyan:    66,
  white:   7, bold_white:   67,
  default: 9
).freeze

MODE_CODES = Hash.new(0).update(
  default:   0, # Turn off all attributes
  bold:      1, # Set bold mode
  italic:    3, # Set italic mode
  underline: 4, # Set underline mode
  blink:     5, # Set blink mode
  swap:      7, # Exchange foreground and background colors
  hide:      8  # Hide text (foreground color would be the same as background)
).freeze

def color(color)
  COLOR_CODES[color] + 30
end

def background_color(color)
  COLOR_CODES[color] + 40
end

def mode(mode)
  MODE_CODES[mode]
end

def colorize(mode: :blink, fg: :default, bg: :default, text:)
  "\033[#{mode(mode)};#{color(fg)};#{background_color(bg)}m#{text}\033[0m"
end

def format_text(text, width:)
  text.to_s.gsub('bold_', 'b ').upcase.center(width || BLOCK_WIDTH)
end

def color_fg(text: '', color:, width: nil, mode: :mode)
  color = [:black, :bold_black].include?(color) ? :bold_yellow : color
  colorize(fg: color, text: format_text(text, width: width), mode: mode)
end

def color_bg(text: '', color:, width: nil, mode: :mode)
  color_fg = [:black, :bold_black].include?(color) ? :bold_yellow : :black
  colorize(fg: color_fg, bg: color, text: format_text(text, width: width), mode: mode)
end

NAME = 'vvveleva'.split

def print_vvveleva
  rainbow = [:red, :bold_red, :yellow, :green, :cyan, :blue, :bold_magenta, :magenta]
  arr = 'vvveleva'.chars.zip(rainbow).map do |letter, color|
      color_fg(text: letter, color: color)
  end

    puts ''
    puts arr.join
    puts ''
end

#### PRINT COLORS

print_vvveleva
