 FROM python:latest
 #defining the base image.

 WORKDIR /app
 #defining the working directory for our application

 COPY ./requirements.txt /app
 #copy the requirements file to the container.

 RUN pip install --no-cache-dir --upgrade -r requirements.txt
 #installing the packages pecified on the requirements file.


 COPY ./ /app
#copy everything on the working local environment to the remote '/app' directory

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "--reload", "80"]
#Starting the server on port 80 --> inside the docker container

#################################
# - Now we are building the image via this comand.
# - docker build -t channel_api .
# - After a successful build.
# - View your image b executing ''
# - run the container by executing 'docker run -d -p 5000:80 channel_api'