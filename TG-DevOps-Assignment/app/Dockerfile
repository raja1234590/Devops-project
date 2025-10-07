FROM python:3.9-slim

WORKDIR /app
COPY process.py .
COPY requirements.txt .

RUN pip install --no-cache-dir boto3 pandas

CMD ["python", "process.py"]
