FROM ubuntu:14.04

RUN apt-get update &&  apt-get -y install \
  default-jre wget bzip2 curl libfreetype6 \
  libgl1-mesa-dev libglu1-mesa libxi6 libxrender1 \
  && apt-get -y autoremove && rm -rf /var/lib/apt/lists/*


WORKDIR /root

RUN wget https://download.blender.org/release/Blender2.79/blender-2.79a-linux-glibc219-x86_64.tar.bz2 && tar xf blender-2.79a-linux-glibc219-x86_64.tar.bz2 && rm blender-2.79a-linux-glibc219-x86_64.tar.bz2 && mv blender-2.79a-linux-glibc219-x86_64 /root/blender

RUN wget https://git.greth.me/Blender/loki-render/raw/4b0f11df81159911958ba836862ccc136018d92d/loki/dist/loki3.jar -O /root/loki.jar

CMD ["/bin/sh", "-c", "java -jar loki.jar /root/blender/blender $LOKI_MASTER"]
