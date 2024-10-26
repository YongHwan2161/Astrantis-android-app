# Use the official VS Code Codespaces image as a base
FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

# Install OpenJDK 11
RUN apt-get update && apt-get install -y openjdk-11-jdk

# Set JAVA_HOME environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH="$JAVA_HOME/bin:$PATH"

# Install Android SDK command-line tools
RUN mkdir -p /usr/local/android-sdk/cmdline-tools
WORKDIR /usr/local/android-sdk/cmdline-tools
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-9123335_latest.zip -O cmdline-tools.zip \
    && unzip cmdline-tools.zip \
    && rm cmdline-tools.zip

# Set Android SDK environment variables
ENV ANDROID_SDK_ROOT=/usr/local/android-sdk
ENV PATH="$ANDROID_SDK_ROOT/cmdline-tools/bin:$ANDROID_SDK_ROOT/platform-tools:$PATH"

# Accept licenses and install SDK components
RUN yes | sdkmanager --licenses
RUN sdkmanager "platform-tools" "platforms;android-31" "build-tools;31.0.0"

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
