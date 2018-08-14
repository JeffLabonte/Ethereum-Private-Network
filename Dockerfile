FROM ubuntu:18.04


RUN mkdir /network && cd /network
VOLUME /network
WORKDIR /network

RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y software-properties-common 
RUN add-apt-repository -y ppa:ethereum/ethereum &&  apt-get update && apt-get install ethereum -y
COPY genesis.json .
COPY docker-entrypoint.sh .

EXPOSE 8545 30303 30301
ENTRYPOINT ["/network/docker-entrypoint.sh"]
CMD ["geth", "--datadir=/network/chaindata"]
