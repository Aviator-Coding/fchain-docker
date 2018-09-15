FROM phusion/baseimage

RUN apt-get update && \
    apt-get --no-install-recommends --yes install \
         git \
         automake \
         build-essential \
         libtool \
         autotools-dev \
         autoconf \
         pkg-config \
         libssl-dev \ 
         libboost-all-dev \
         libevent-dev \
         bsdmainutils \
         vim \
         software-properties-common && \
         rm -rf /var/lib/apt/lists/* &&\
         apt-get clean

RUN add-apt-repository ppa:bitcoin/bitcoin && \
    apt-get update && \
    apt-get --no-install-recommends --yes install \
          libdb4.8-dev \
          libdb4.8++-dev \
          libminiupnpc-dev && \
          rm -rf /var/lib/apt/lists/*  &&\
          apt-get clean

WORKDIR /fchain

ENV FCHAIN_VERSION 1.0.0

RUN git clone -b master https://github.com/foundchain/FCHAIN.git . && \
    git checkout $FCHAIN_VERSION && \
    ./autogen.sh && \
    ./configure && \
    make &&\
    strip /fchain/src/fchaind /fchain/src/fchain-cli && \
    mv /fchain/src/fchaind /usr/local/bin/ && \
    mv /fchain/src/fchain-cli /usr/local/bin/ && \
    # clean
    rm -rf /fchain 

VOLUME ["/root/.fchain"]

EXPOSE 6565

CMD exec fchaind && tail -f /root/.fchain/debug.log