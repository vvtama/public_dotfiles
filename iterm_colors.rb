BLOCK_WIDTH = 15
SPACE = (' ' * 2).freeze

HEX_COLORS = {
  black:   "#263338", bold_black:   "#1e2b30",
  red:     "#dc312e", bold_red:     "#cb4a16",
  green:   "#97ad11", bold_green:   "#586d74",
  yellow:  "#e5a900", bold_yellow:  "#657b82",
  blue:    "#5a9bdb", bold_blue:    "#839495",
  magenta: "#dc3185", bold_magenta: "#6c6ec6",
  cyan:    "#2aa197", bold_cyan:    "#93a0a1",
  white:   "#eee8d5", bold_white:   "#fdf6e3",
}.freeze

RGB_COLORS = {
  black:   "38, 51, 56",  bold_black: "30, 43, 48",
  red:     "220, 49, 46", bold_red: "203, 74, 22",
  green:   "151, 173, 17", bold_green: "88, 109, 116",
  yellow:  "229, 169, 0", bold_yellow: "101, 123, 130",
  blue:    "90, 155, 219", bold_blue: "131, 148, 149",
  magenta: "203, 66, 131", bold_magenta: "108, 110, 198",
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

def print_terminal_slices
  blocks = TERMINAL_COLOR_NAMES.map do |color|
    width = 9
    [
      color_bg(text: HEX_COLORS[color], color: color, width: width),
      color_fg(text: color, color: color, width: width),
    ]
  end

  slices = blocks.each_slice(8).map do |block_arr|
    spaces = [SPACE * 15] * block_arr[0].length
    spaces.zip(*block_arr).map { |arr| arr.join(' ') }
  end

  slices.each { |slice| puts slice }
end

def print_hue_slices
  hue_blocks = TERMINAL_HUE.map do |color|
    [
      color_bg(color: color),
      color_bg(text: HEX_COLORS[color], color: color, mode: :bold),
      color_bg(text: RGB_COLORS[color], color: color, mode: :italic),
      # color_bg(text: color, color: color),
      color_bg(color: color),
      color_fg(text: color, color: color),
    ]
  end

  hue_slices = hue_blocks.each_slice(8).map do |block_arr|
    spaces = [SPACE] * block_arr[0].length
    spaces.zip(*block_arr).map(&:join) << "\n"
  end

  hue_slices.each { |slice| puts slice }
end


def print_separator
  separator = colorize(mode: :underline, fg: :black, text: ' ' * (8 * BLOCK_WIDTH))
  puts ''
  puts separator
  puts ''
  puts ''
end

#### PRINT COLORS

# print_separator
# print_terminal_slices
print_separator
print_hue_slices
print_separator
