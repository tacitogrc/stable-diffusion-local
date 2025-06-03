FROM nvidia/cuda:12.1.1-cudnn8-runtime-ubuntu22.04

# Evitar interação durante a instalação
ENV DEBIAN_FRONTEND=noninteractive

# Instalações do sistema
RUN apt-get update && \
    apt-get install -y git wget python3 python3-pip python3-venv libgl1 libglib2.0-0 && \
    apt-get clean

# Criação do diretório da aplicação
WORKDIR /app

# Clone do repositório
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git .

# Instalação dos requisitos Python
RUN python3 -m venv venv && \
    . venv/bin/activate && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

# Expor a porta do web UI
EXPOSE 7860

# Comando de execução padrão
CMD ["bash", "webui.sh", "--xformers", "--listen"]
