import telebot, asyncdispatch, logging
from strutils import strip

var L = newConsoleLogger()
addHandler(L)

const API_KEY = slurp("secret.key").strip()

proc updateHandler(b: Telebot, u: Update): Future[bool] {.gcsafe, async.} =
  var response = u.message
  if response.text.len > 0:
    let text = response.text
    var playBtn = InlineKeyboardButton(
      text: "Play now!",
      webApp: WebAppInfo(url: "https://ethosa.github.io/tg-webapp-happyx/#/")
    )

    discard await b.sendMessage(
      response.chat.id, text,
      replyMarkup = InlineKeyboardMarkup(
        kind: kInlineKeyboardMarkup,
        inlineKeyboard: @[@[playBtn]]
      )
    )

when isMainModule:
  let bot = newTeleBot(API_KEY)

  bot.onUpdate(updateHandler)
  bot.poll(timeout=300, clean = true)
