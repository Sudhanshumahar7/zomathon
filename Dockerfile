# Use official lightweight Python 3.9 image as base
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file first (for better Docker layer caching)
COPY backend/requirements.txt .

# Install Python dependencies
# --no-cache-dir reduces image size by not storing pip cache
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire backend source code into the container
COPY backend/ ./backend/

# Command to run the FastAPI app using Uvicorn
# --host 0.0.0.0 makes it accessible outside the container
# --port 7860 specifies the port the app will run on
CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "7860"]