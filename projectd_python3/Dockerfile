FROM python:3
USER root

RUN apt-get update
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

EXPOSE 9000
ENV PORT 9000
ENV HOST "0.0.0.0"

RUN apt-get install -y vim less
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install uvicorn
RUN pip install youtube-dl
RUN apt-get install -y libgl1-mesa-dev
RUN pip install subprocess.run
RUN pip install uvicorn
RUN pip install mysql-connector-python
RUN pip install popen
RUN pip install pafy
RUN pip install asyncio


