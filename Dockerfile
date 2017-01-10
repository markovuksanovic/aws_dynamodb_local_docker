FROM ubuntu

ADD http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz /tmp/dynamodb.tar.gz
WORKDIR /tmp
RUN tar -xvf dynamodb.tar.gz

RUN apt-get update && apt-get install -y openjdk-8-jre-headless

EXPOSE 8000

CMD java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb -cors *
