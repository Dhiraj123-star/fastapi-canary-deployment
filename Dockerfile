FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Set build-time argument
ARG VERSION
ENV VERSION=${VERSION}

# Copy all app files
COPY app/ /app/

# Generate main.py from template
RUN sed "s/{{VERSION}}/${VERSION}/g" /app/main.template.py > /app/main.py

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
