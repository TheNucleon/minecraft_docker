FROM openjdk:25-slim
RUN mkdir /minecraft && mkdir /minecraft/data
COPY server_VERSION.jar /minecraft
WORKDIR /minecraft/data
COPY startup.sh /minecraft
ENV EULA="" RAMAX=8192M RAMIN=1024M
VOLUME ["/minecraft"]
EXPOSE 25565
ENTRYPOINT ["/minecraft/startup.sh"]
