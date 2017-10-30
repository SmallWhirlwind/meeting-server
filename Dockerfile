FROM maven

COPY . /Meet_Server
WORKDIR /Meet_Server

CMD \
  java -jar target/meeting-0.0.1-SNAPSHOT.jar