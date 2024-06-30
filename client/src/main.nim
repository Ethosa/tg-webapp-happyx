# Import HappyX
import
  happyx,
  telebot/webapp


var tg = Telegram.WebApp
var data = remember $window.location.href


# Declare application with ID "app"
appRoutes("app"):
  # Основная страница
  "/{p:path}":
    # Component usage
    tDiv(class = "flex flex-col w-screen min-h-screen h-full bg-blue-900 text-white p-12"):
      tP:
        "Hello from Nim!"
      tP:
        {p}
