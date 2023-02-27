# Use latest stable channel SDK.
FROM google/dart
RUN apt -y update && apt -y upgrade

# Resolve app dependencies.
WORKDIR /server
COPY pubspec.* ./
COPY .env .env
RUN dart pub get

# Copy app source code (except anything in .dockerignore) and AOT compile app.
COPY . .
RUN dart pub get --offline
RUN dart compile kernel -o bin/main.dill bin/main.dart

# Build minimal serving image from AOT-compiled `/server`
# and the pre-built AOT-runtime in the `/runtime/` directory of the base image.
FROM subfuzion/dart-scratch
COPY --from=0 /usr/lib/dart/bin/dart /usr/lib/dart/bin/dart
COPY --from=0 /server/bin/main.dill /server/bin/main.dill

# Start server.
EXPOSE 8080
ENTRYPOINT [ "/usr/lib/dart/bin/dart", "/server/bin/main.dill" ]
