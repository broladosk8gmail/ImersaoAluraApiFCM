FROM python:3.13.5-alpine3.22 

WORKDIR /app

COPY requirements.txt requirements.txt

EXPOSE 8000

RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

COPY . /app

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
