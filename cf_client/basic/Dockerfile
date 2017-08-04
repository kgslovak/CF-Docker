###################
# cf_client:basic #
###################

FROM ubuntu:16.04
LABEL maintainer Kyle G Slovak <kgslovak@gatech.edu>
ENV APT_LAST_UPDATED 2017-07-25

RUN apt-get update \
 && apt-get install --no-install-recommends -y \
	git \
	python3 \
	python3-numpy \
	python3-pip \
	python3-pyqt5 \
	python3-zmq

RUN pip3 install --upgrade pip setuptools \
 && pip3 install \
	pyqtgraph \
	pyusb==1.0.0b2

RUN git clone https://github.com/bitcraze/crazyflie-lib-python.git \
 && git clone https://github.com/bitcraze/crazyflie-clients-python.git

RUN cd crazyflie-lib-python     && pip3 install -e . && cd .. \
 && cd crazyflie-clients-python && pip3 install -e . && cd ..

ENTRYPOINT ["cfclient"]
