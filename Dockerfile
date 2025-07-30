# Stage 1: The builder stage
FROM python:3.11-slim as builder

# Set the working directory
WORKDIR /app

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Stage 2: The final stage
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy installed packages and application code from the builder stage
COPY --from=builder /app /app

# Expose the port the app runs on
EXPOSE 8000

# Command to run the application
# Binds to 0.0.0.0 to be accessible from outside the container
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]