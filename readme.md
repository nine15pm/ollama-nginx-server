# Ollama server running on Docker (with nginx proxy)

A simple single docker container running ollama server with an nginx proxy that checks external requests against api keys.

1. Edit the `apikeys-example.conf` file and replace the keys with your own keys. **RENAME** the file to `apikeys.conf`.
2. Edit the `nginx.conf` file, replace `listen 5000;` with your desired port number
3. Edit dockerfile and replace `EXPOSE 5000` with your desired port number
4. Edit the `start.sh` file and repalce `avr/sfr-embedding-mistral:q8_0` with desired model to download when server starts
5. Run `docker build -t ollama-server .` to build a docker image
6. Run `docker volume create ollama_data` to create a volume to store any downloaded models
7. Run `docker run --gpus all --name ollama-server -p <your port number>:<your port number> -v ollama_data:/root/.ollama` to start the server
