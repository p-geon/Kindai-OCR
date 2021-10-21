FROM pytorch/pytorch:1.4-cuda10.1-cudnn7-runtime

ENV DEBCONF_NOWARNINGS yes
ENV DEBIAN_FRONTEND=noninteractive
COPY ./requirements.txt ./

RUN apt-get update && apt-get install -y --quiet --no-install-recommends \
    wget \
    gcc \
    libopencv-dev

RUN pip install -q --upgrade pip
RUN pip install -r requirements.txt -q


WORKDIR /work
EXPOSE 8888
CMD ["/bin/bash"]
