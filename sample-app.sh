#!/bin/bash
mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp sample_appWeb.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.
#Create a Dockerfile
echo "FROM python" >> tempdir/Dockerfile
echo "RUN pip install flask" >>tempdir/Dockerfile
echo "COPY ./static /home/myapp/static" >> tempdir/Dockerfile
echo "COPY ./templates /home/myapp/templates/" >> tempdir/Dockerfile
echo "COPY sample_appWeb.py /home/myapp/" >> tempdir/Dockerfile
#Docker Expose port 8080
echo "EXPOSE 8080" >> tempdir/Dockerfile
#CMD execute command the Python script
echo "CMD python3 /home/myapp/sample_appWeb.py" >> tempdir/Dockerfile

cd tempdir
docker build -t sampleapp .
docker run -t -d -p 8080:8080 --name samplerunning sampleapp
docker ps -a 




