# our base image
FROM python:3.6-alpine

# install Python modules needed by the Python app
# copy files required for the app to run
COPY . /app
WORKDIR /app
RUN pip install  --no-cache-dir -r requirements.txt

# tell the port number the container should expose
EXPOSE 5000

# run the application
ENTRYPOINT ["python"]
CMD ["app/app.py"]
