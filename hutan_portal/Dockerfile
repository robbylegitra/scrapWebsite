# Use an official Python runtime as a parent image
FROM python:3.12
FROM selenium/standalone-chrome

# Install dependencies jika perlu
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && pip3 install django selenium \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY .. .

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
