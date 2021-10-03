# syntax=docker/dockerfile:1

# Install Python
FROM python:3.8-slim-buster

# Create and change directory
WORKDIR /HelloWorldApp

# Copy files from current directory to image working directory
COPY . .

# Install dependencies
RUN pip install -r requirements.txt

# We need to make the application externally visible (i.e. from outside the container) by specifying --host=0.0.0.0.
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]