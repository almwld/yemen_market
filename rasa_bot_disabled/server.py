from fastapi import FastAPI, Header, HTTPException
from pydantic import BaseModel

API_KEY = "fab2cf0cd6af22baa1d31dd9933c56b252b94c8a750e9ee1d3db2ce764039f16"

app = FastAPI()

class Message(BaseModel):
    sender: str
    message: str

@app.post("/webhooks/rest/webhook")
def chat(
    msg: Message,
    x_api_key: str = Header(None)
):
    if x_api_key != API_KEY:
        raise HTTPException(status_code=401, detail="Unauthorized")

    text = msg.message.lower()

    if "سعر" in text or "price" in text:
        if "سكر" in text or "sugar" in text:
            return [{"text": "سعر السكر 1200 ريال يمني"}]
        if "أرز" in text or "rice" in text:
            return [{"text": "سعر الأرز 2500 ريال يمني"}]
        return [{"text": "حدد اسم المنتج"}]

    if "عمولة" in text or "commission" in text:
        return [{"text": "عمولة السوق 5٪ من سعر المنتج"}]

    if "توصيل" in text or "delivery" in text:
        return [{"text": "التوصيل متوفر داخل المدن الرئيسية"}]

    return [{"text": "مرحبا 👋 كيف أساعدك؟"}]
