FROM ubuntu:16.04

MAINTAINER Ilya Malyutin <solino@list.ru>

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
        python3 \
        python3-dev \
        python3-pip \
        python3-setuptools \
        rsync \
        software-properties-common \
        unzip \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 --no-cache-dir install \
        Pillow \
        h5py \
        ipykernel \
        jupyter \
        matplotlib \
        numpy \
        pandas \
        scipy \
        sklearn \
        nltk \
        && \
    python3 -m ipykernel.kernelspec

RUN pip3 install --upgrade pip

# --- DO NOT EDIT OR DELETE BETWEEN THE LINES --- #
# These lines will be edited automatically by parameterized_docker_build.sh. #
# COPY _PIP_FILE_ /
# RUN pip --no-cache-dir install /_PIP_FILE_
# RUN rm -f /_PIP_FILE_

# Install TensorFlow CPU version from central repo
RUN pip3 --no-cache-dir install tensorflow
# --- ~ DO NOT EDIT OR DELETE BETWEEN THE LINES --- #

# RUN ln -s /usr/bin/python3 /usr/bin/python#

# Copy sample notebooks.
COPY src /app

# TensorBoard
EXPOSE 6000
# IPython
EXPOSE 8080

WORKDIR "/app"

CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--port", "8080", "--allow-root"]