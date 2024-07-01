# Import HappyX
import happyx
import telebot/webapp


var tg = Telegram.WebApp


# Declare application with ID "app"
appRoutes("app"):
  # Основная страница
  "/{p:path}":
    # Component usage
    tDiv(
      class = "flex flex-col w-screen min-h-screen h-full p-12",
      style = fmt"background: {tg.themeParams.bg_color}; color: {tg.themeParams.text_color}"
    ):
      tP:
        "Hello from Nim!"
      tP:
        {p}
      tP:
        {tg.version}
