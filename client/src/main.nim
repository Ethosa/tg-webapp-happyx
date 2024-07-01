# Import HappyX
import happyx
import telebot/webapp


var
  tg = Telegram.WebApp
  themeParams = tg.themeParams
  bgColor = themeParams.bg_color
  textColor = themeParams.text_color


# Declare application with ID "app"
appRoutes("app"):
  # Основная страница
  "/{p:string}":
    tDiv(
      class = "flex flex-col w-screen min-h-screen h-full p-12",
      style = fmt"background: {bgColor}; color: {textColor}"
    ):
      tP:
        "Hello from Nim!"
      tP:
        {window.location.href}
      tP:
        {p}
      tP:
        {tg.version}
