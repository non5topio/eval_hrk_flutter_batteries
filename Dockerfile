FROM debian:bookworm-slim AS base
# Using debian:bookworm-slim instead of alpine for simplicity

FROM base AS flutter-env
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      curl \
      git \
      unzip \
      xz-utils \
      zip \
      ca-certificates \
      libglu1-mesa; \
    rm -rf /var/lib/apt/lists/*

ARG FLUTTER_ROOT=/opt/flutter
ENV FLUTTER_ROOT=$FLUTTER_ROOT
ENV PATH=$FLUTTER_ROOT/bin:$PATH
RUN set -eux; \
    echo FLUTTER_ROOT=$FLUTTER_ROOT; \
    mkdir -p "$FLUTTER_ROOT"; \
    git clone \
      --branch stable \
      --depth 1 \
      https://github.com/flutter/flutter "$FLUTTER_ROOT"; \
    flutter --version

FROM flutter-env AS app-dependencies
WORKDIR /app
COPY pubspec.yaml ./
RUN flutter pub upgrade

FROM app-dependencies AS app
COPY . .

FROM app AS ci-dependencies
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        lcov; \
    rm -rf /var/lib/apt/lists/*

FROM ci-dependencies AS ci-increase-coverage
RUN ./tool/ci-increase-coverage.sh