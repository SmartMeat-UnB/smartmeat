# Definindo a imagem base da imagem de docker que está sendo criada
FROM jenkins/jenkins:lts

# Alternando para o usuário root para instalar dependências e flutter
USER root

# Instalando as diferentes dependências necessárias para o Flutter, instalando o flutter do canal beta do github e concedendo permissões ao usuário jenkins na pasta
RUN apt-get update && apt-get install -y --force-yes git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3 \
    && apt-get clean \
    && git clone -b beta https://github.com/flutter/flutter.git /usr/local/flutter \
    && chown -R jenkins:jenkins /usr/local/flutter

# Mudando para o usuário jenkins
USER jenkins

# Executando o médico de vibração para verificar se o vibração foi instalado corretamente
RUN /usr/local/flutter/bin/flutter doctor -v \
    && rm -rfv /flutter/bin/cache/artifacts/gradle_wrapper

# Configurando flutter e dart-sdk como PATH para que eles sejam acessíveis a partir do terminal
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"
