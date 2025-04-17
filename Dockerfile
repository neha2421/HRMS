# Use the official Python image as the base
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Install PostgreSQL development libraries
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements.txt file into the container
COPY requirements.txt .

# Upgrade pip to the latest version
RUN pip install --upgrade pip

# Install Python dependencies
RUN pip install -r requirements.txt

# Copy project files to the container
COPY . .

# Expose the port your app will run on (for Django, it's typically 8000)
EXPOSE 8000

# Define the default command to run the app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]







