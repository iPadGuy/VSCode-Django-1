# Visual Studio Code Tutorial for Python

**README**

Ref1: https://code.visualstudio.com/docs/python/tutorial-django
Ref2: https://code.visualstudio.com/docs/containers/quickstart-python


##### Friday, October 23, 2020
- I finished the Django tutorial, and am working on the VSC Docker Tutorial
    - It looks like the free version of Docker doesn't include PostgreSQL support
- I encountered a "naive DateTime" error while debugging in the Docker container
    - The Docker container didn't have a timezone configured
    - I added `ENV TZ=America/Toronto` to the Dockerfile, but this makes it the default for everybody, in all timezones.
    