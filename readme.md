# 1. Build da imagem
docker-compose build

# 2. Execução do container
docker-compose up

# 3. Versão para equipamentos mais modestos
docker compose -f docker-compose.cpu.yml -d --build