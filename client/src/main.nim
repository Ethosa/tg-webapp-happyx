import
  happyx,
  telebot/webapp


# Задаем переменную для удобства
var tg = Telegram.WebApp

# Создаем реактивный счетчик
var counter = remember 0

# Настраиваем внешний вид главной кнопки снизу приложения
discard tg.MainButton.setText("Click me!")
discard tg.MainButton.show()
discard tg.MainButton.onClick(proc() =
  # При клике на кнопку увеличиваем наш счетчик
  counter->inc()
)
# Разворачиваем приложение на весь экран (mobile only)
tg.expand()


# Объявляем наше приложение
appRoutes "app":
  # Основная страница
  "/{p:string}":
    tDiv(
      class = fmt"flex flex-col w-screen min-h-screen h-full p-12 bg-[{tg.themeParams.bgColor}] text-[{tg.themeParams.textColor}]",
    ):
      tP(class = "text-3xl"):
        "Hello from Nim!"
      tP(class = "text-7xl"):
        {counter}
      tDiv(class = "fixed bottom-4 right-4 opacity-70"):
        tP:
          "Your telegram version is v"
          {tg.version}
