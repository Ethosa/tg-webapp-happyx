import
  telebot,
  std/asyncdispatch,
  std/logging,
  std/strutils


const API_KEY = slurp("secret.key").strip()


proc updateHandler(b: Telebot, u: Update): Future[bool] {.gcsafe, async.} =
  var response = u.message
  if response.text.len > 0:
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


when isMainModule:
  var L = newConsoleLogger()
  addHandler(L)

  let bot = newTeleBot(API_KEY)

  bot.onUpdate(updateHandler)
  bot.poll(timeout=300, clean = true)
