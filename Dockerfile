# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.9-slim-buster
# ARG DEBIAN_FRONTEND=noninteractive

# 2020-Oct-24 PAL - Testing apt commands
# RUN apt-get update \
#    && apt-get install -y --no-remove --no-install-recommends tzdata

EXPOSE 8000

# 2020-Oct-24 PAL - Configure local timezone
ENV TZ=America/Toronto

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
ADD requirements.txt .
RUN python -m pip install -r requirements.txt

WORKDIR /app
ADD . /app

# Switching to a non-root user, please refer to https://aka.ms/vscode-docker-python-user-rights
RUN useradd appuser && chown -R appuser /app
USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
# File wsgi.py was not found in subfolder: 'Django-1'. Please enter the Python path to wsgi file.
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "pythonPath.to.wsgi"]
