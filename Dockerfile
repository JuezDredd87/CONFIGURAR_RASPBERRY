FROM ubuntu:latest

RUN apt-get update && apt-get install -y ksh \
&& apt-get install -y python3 \
&& apt-get -y install -y vim \
&& apt-get -y install bash \
&& apt-get clean \
&& rm -rf /var/lib/apt/list/*

RUN mkdir -p /opt/Scripts/CONFIGURAR_RASPBERRY
COPY instalar_ffmpeg /opt/Scripts/CONFIGURAR_RASPBERRY
COPY instalar_unrar_nonfree /opt/Scripts/CONFIGURAR_RASPBERRY

WORKDIR /opt/Scripts/CONFIGURAR_RASPBERRY

RUN chmod +x /opt/Scripts/CONFIGURAR_RASPBERRY/dependencias
RUN /opt/Scripts/CONFIGURAR_RASPBERRY/dependencias
RUN chmod +x /opt/Scripts/CONFIGURAR_RASPBERRY/instalar_ffmpeg.sh
RUN /opt/Scripts/CONFIGURAR_RASPBERRY/instalar_ffmpeg.sh
RUN chmod +x /opt/Scripts/CONFIGURAR_RASPBERRY/instalar_unrar_nonfree.sh
RUN /opt/Scripts/CONFIGURAR_RASPBERRY/instalar_unrar_nonfree.sh


EXPOSE 80
ENV ENVIRONMENT DOCKER_DEV
ENV NAME Script_descomprimir_mover_videos
ENV RUTA_CONFIGURACION /opt/Scripts/CONFIGURACION
ENV RUTA_SCRIPTS_UTILS /opt/Scripts/UTILS
ENV RUTA_SCRIPTS /opt/Scripts

