FROM gitpod/workspace-full

RUN git clone https://github.com/flutter/flutter.git -b stable /home/gitpod/flutter
ENV PATH="/home/gitpod/flutter/bin:/home/gitpod/flutter/bin/cache/dart-sdk/bin:${PATH}"

RUN flutter doctor

RUN flutter config --enable-web
