  
# use a python image
FROM python:3.6

# set the working directory in the container to /app
WORKDIR /app

# add the current directory to the container as /app
COPY . /app

# pip install flask
RUN pip install --upgrade pip && \
    pip install \
        Flask \
        awscli \
        flake8 \
        pylint \
        pytest \
        flask_mysqldb \
        pytest-flask

# expose the default flask port
EXPOSE 5000

# execute the Flask app
ENTRYPOINT ["python"]
HEALTHCHECK CMD curl --fail http://localhost:5000/ || exit 1
CMD ["/app/main.py"]
