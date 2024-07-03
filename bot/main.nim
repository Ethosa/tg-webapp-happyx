import
  telebot,
  std/asyncdispatch,
  std/logging,
  std/strutils


# Получаем API ключ для работы с ботом
const API_KEY = slurp("secret.key").strip()


# Обработчик всех входящих событий
proc updateHandler(b: Telebot, u: Update): Future[bool] {.gcsafe, async.} =
  var response = u.message
  if response.text.len > 0:
    # Отсылаем обратно сообщение с единственной кнопкой
    discard await b.sendMessage(
      response.chat.id, "Play in this now!",
      replyMarkup = InlineKeyboardMarkup(
        kind: kInlineKeyboardMarkup,
        inlineKeyboard: @[@[InlineKeyboardButton(
          text: "Play now!",
          webApp: WebAppInfo(url: "https://ethosa.github.io/tg-webapp-happyx/#/")
        )]]
      )
    )


# Блок ниже скомпилируется только в том случае,
# если мы запускаем этот файл напрямую.
#
# аналог питоновского if __name__ == '__main__'
when isMainModule:
  # Подрубаем логирование
  var L = newConsoleLogger()
  addHandler(L)

  # Создаем экземпляр бота
  let bot = newTeleBot(API_KEY)

  # Запускаем слушатель
  bot.onUpdate(updateHandler)
  bot.poll(timeout=300, clean = true)
