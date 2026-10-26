from kitty.fast_data_types import Screen
from kitty.tab_bar import DrawData, ExtraData, TabBarData, as_rgb, draw_title

LEFT_CAP = ""
RIGHT_CAP = ""
GAP = " "


def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_tab_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    tab_bg = screen.cursor.bg
    tab_fg = screen.cursor.fg
    bar_bg = as_rgb(int(draw_data.default_bg))

    screen.cursor.fg = tab_bg
    screen.cursor.bg = bar_bg
    screen.draw(LEFT_CAP)

    screen.cursor.fg = tab_fg
    screen.cursor.bg = tab_bg
    screen.draw(" ")
    tail = 2 + (0 if is_last else len(GAP))
    draw_title(draw_data, screen, tab, index, max(1, max_tab_length - 2 - tail))
    extra = screen.cursor.x - before + tail - max_tab_length
    if extra > 0 and extra + 1 < screen.cursor.x:
        screen.cursor.x -= extra + 1
        screen.draw("…")
    screen.draw(" ")

    screen.cursor.fg = tab_bg
    screen.cursor.bg = bar_bg
    screen.draw(RIGHT_CAP)

    screen.cursor.fg = 0
    screen.cursor.bg = bar_bg
    if not is_last:
        screen.draw(GAP)
    screen.cursor.bg = 0
    return screen.cursor.x
