# Import HappyX
import happyx
import telebot/webapp


var tg = Telegram.WebApp


proc MainPage(): TagRef =
  buildHtml:
    # Component usage
    tDiv(
      class = "flex flex-col w-screen min-h-screen h-full p-12",
      style = fmt"background: {tg.themeParams.bg_color}; color: {tg.themeParams.text_color}"
    ):
      tP:
        "Hello from Nim!"
      tP:
        {window.location.href}
      tP:
        {tg.version}


# Declare application with ID "app"
appRoutes("app"):
  # Основная страница
  "/":
    MainPage
  "":
    MainPage
  "/{p:path}":
    MainPage
