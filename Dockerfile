FROM janwh/latex

WORKDIR /tmp

RUN wget -q https://downloads.sourceforge.net/project/biblatex-biber/biblatex-biber/current/binaries/Linux/biber-linux_x86_64.tar.gz -O biber-linux.tar.gz
RUN tar -xvf biber-linux.tar.gz
RUN mv biber /usr/bin/biber
RUN chmod +x /usr/bin/biber

# https://github.com/plk/biblatex
RUN apt-get update \
  && apt-get install -yq git
RUN git clone https://github.com/plk/biblatex.git
WORKDIR /tmp/biblatex
RUN git checkout v3.11-ctan
RUN obuild/build.sh install 3.11 /root/texmf

WORKDIR /data
CMD ["latexmk", "-pdf", "/data/publications-daniel-nuest.tex"]
