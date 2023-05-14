# Imagem base: minima
FROM ubuntu:18.04

# Variável de ambiente pra codificação
ENV LANG=C.UTF-8

# Instalando pacotes necessários
RUN apt-get update \
    && apt-get install -y flex g++ make \
    && rm -rf /var/lib/apt/lists/*

# Copiando arquivos fonte
COPY . /usr/src/tp0
WORKDIR /usr/src/tp0

# compila o arquivo principal lex.l
RUN make

# compila o arquivo secundário lex-2.l com as definições para um contexto de banco
RUN make bank

# Roda o Make por padrão
CMD ["bash", "./run.sh"]