# Get an linux-image from Docker Repository which include Python 3.9
FROM python:3.9

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

# install all necessary python packages for our little app
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# copy our application's code from the repo to our working directory in the container
COPY ./app /code/app

# run the server and serve our application
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]

