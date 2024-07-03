FROM ollama/ollama

RUN apt-get update && \
    apt-get install -y -q nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY apikeys.conf /etc/nginx/apikeys.conf

ENV OLLAMA_DEBUG="1"
ENV OLLAMA_HOST=127.0.0.1
ENV OLLAMA_ORIGINS=http://localhost,https://localhost,http://localhost:*,https://localhost:*,http://127.0.0.1,https://127.0.0.1,http://127.0.0.1:*,https://127.0.0.1:*,app://*,file://*,tauri://*

EXPOSE 5000

COPY start.sh /
RUN chmod +x /start.sh
ENTRYPOINT []
CMD ["/bin/bash", "-c", "\
    echo 'Killing any existing ollama process'; \
    pkill ollama || true; \
    echo 'Running start.sh'; \
    /start.sh \
"]