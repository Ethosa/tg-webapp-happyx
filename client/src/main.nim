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
      class = fmt"flex flex-col justify-content items-center w-screen min-h-screen h-screen p-12 bg-[{tg.themeParams.bgColor}] text-[{tg.themeParams.textColor}]",
    ):
      tDiv(class = "w-full h-full flex flex-col items-center justify-center"):
        tP(class = "text-xl"):
          "Hello from Nim, "
          tSpan(class = fmt"text-[{tg.themeParams.buttonColor}]"):
            {tg.initDataUnsafe.user.first_name}
          "!"
        tP(class = "text-9xl"):
          {counter}
      tDiv(class = "fixed bottom-4 right-4 opacity-70"):
        "Your telegram version is v"
        {tg.version}
