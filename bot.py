from aiogram import Bot, Dispatcher, types
from aiogram.types import InlineQueryResultArticle, InputTextMessageContent
import asyncio
import uuid
import os

TOKEN = os.getenv("TOKEN")

bot = Bot(token=TOKEN)
dp = Dispatcher()

@dp.inline_query()
async def inline_handler(query: types.InlineQuery):

    result = InlineQueryResultArticle(
        id=str(uuid.uuid4()),
        title="Отправить сообщение",
        input_message_content=InputTextMessageContent(
            message_text="Привет! Я бот 👋"
        )
    )

    await query.answer([result], cache_time=1)

async def main():
    await dp.start_polling(bot)

asyncio.run(main())
