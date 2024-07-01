# Import HappyX
import happyx
import telebot/webapp


var tg = Telegram.WebApp

echo tg[]

var counter = remember 0

discard tg.MainButton.setText("Click me!")
discard tg.MainButton.show()
discard tg.MainButton.onClick(proc() =
  counter->inc()
)
tg.expand()

# Declare application with ID "app"
appRoutes("app"):
  # Основная страница
  "/{p:string}":
    tDiv(
      class = "flex flex-col w-screen min-h-screen h-full p-12",
      style = fmt"background: {tg.themeParams.bgColor}; color: {tg.themeParams.textColor}"
    ):
      tP:
        "Hello from Nim! Counter is "
        {counter}
      tButton(
        style = fmt"background: {tg.themeParams.button_color}; color: {tg.themeParams.button_text_color}"
      ):
        "click me!"
        @click:
          counter->inc()
      tP:
        "Telegram v"
        {tg.version}
