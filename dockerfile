ubuntu:latest

# Установка зависимостей и необходимых пакетов
RUN apt-get update && apt-get install -y \
    curl \
    git \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Установка селф-хостед раннер
RUN mkdir actions-runner && cd actions-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v2.277.1/actions-runner-linux-x64-2.277.1.tar.gz \
    && tar xzf ./actions-runner-linux-x64-2.277.1.tar.gz \
    && ./bin/installdependencies.sh \
    && ./config.sh --url <RUNNER_URL> --token <RUNNER_TOKEN>

# Запуск селф-хостед раннера
CMD ./actions-runner/run.sh
