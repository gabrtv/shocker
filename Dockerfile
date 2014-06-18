FROM ubuntu
RUN apt-get update && apt-get install -yq build-essential
ADD . /app
WORKDIR /app
RUN cc -Wall -std=c99 -O2 shocker.c -static -Wno-unused-result -o shocker
CMD ["./shocker"]