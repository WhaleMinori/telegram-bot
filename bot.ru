import asyncio
import os
import uuid

from aiogram import Bot, Dispatcher
from aiogram.types import InlineQueryResultArticle, InputTextMessageContent

TOKEN = os.getenv("TOKEN")

bot = Bot(token=TOKEN)
dp = Dispatcher()

TEXT = "Не пиши мне до тех пор, пока я первой не откликнусь. Сейчас у меня будут проверять телефон, переписки я чищу. На моё сообщение ты никак не отвечаешь, реакций не ставишь. Спасибо"

@dp.inline_query()
async def inline_handler(inline_query):
    result = InlineQueryResultArticle(
        id=str(uuid.uuid4()),
        title="sos",
        description="Отправить срочное сообщение",
        input_message_content=InputTextMessageContent(
            message_text=TEXT
        )
    )

    await inline_query.answer([result], cache_time=1)

async def main():
    await dp.start_polling(bot)

if __name__ == "__main__":
    asyncio.run(main())
