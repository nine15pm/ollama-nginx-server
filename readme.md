#Ollama server with nginx proxy running on Docker

1. Edit the `apikeys-example.conf` file and replace the keys with your own keys. **RENAME** the file to `apikeys.conf`.
2. Edit the `nginx.conf` file, replace `listen 5000;` with your desired port number
3. Edit the `start.sh` file and repalce `avr/sfr-embedding-mistral:q8_0` with desired model to download when server starts
3. Run `docker build -t ollama-server .` to build a docker image
4. Run `docker run --gpus all --name ollama-server -p <your port number>:<your port number>` to start the server with GPU support