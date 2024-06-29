# Import HappyX
import
  happyx,
  std/jsffi


var tg: JsObject
{.emit: "`tg` = window.Telegram.WebApp;".}


# Declare application with ID "app"
appRoutes("app"):
  "/":
    # Component usage
    tDiv(class = "w-screen min-h-screen h-full bg-blue-900 text-white p-12"):
      "Hello from Nim!"
