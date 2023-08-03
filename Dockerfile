
# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

WORKDIR /app

# Copying the requirements.txt file to the working directory
COPY requirements.txt requirements.txt

# Installing the dependencies specified in the requirements.txt file
# This command is failing because the package manager is being called "pip3" instead of "pip"
RUN pip install -r requirements.txt

# Copying all files from the current directory to the working directory
COPY . .

# The EXPOSE instruction informs Docker that the container listens on the specified network ports at runtime.
# It is used to document which ports are intended to be published.
# In this case, we add the EXPOSE instruction to expose port 5000 for Flask.
EXPOSE 5000

# Running the Flask application
# The container is exiting before becoming healthy because the CMD command is missing a few arguments
# We need to the Flask application include file and the host parameter
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
