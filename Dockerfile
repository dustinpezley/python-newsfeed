
# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

# The EXPOSE instruction informs Docker that the container listens on the specified network ports at runtime.
# It is used to document which ports are intended to be published.
# In this case, we add the EXPOSE instruction to expose port 5000 for Flask.
EXPOSE 5000

# The CMD instruction provides defaults for an executing container.
# Here, we specify the command to be executed when the container starts.
# We start the Flask application using the command "python3 -m flask run --host=0.0.0.0".
# By default, the Flask application listens on port 5000.
CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]
