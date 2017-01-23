FROM ocaml/opam:ubuntu-16.10_ocaml-4.02.3

#RUN apt-get install -y opam
#RUN mkdir /opamroot
#RUN opam init --root=/opamroot
RUN whoami
RUN opam install core 
RUN opam install opium 
RUN mkdir /code
COPY hello.ml /code/hello.ml
COPY Makefile /code/Makefile
COPY build.sh /code/build.sh

WORKDIR /code

RUN /code/build.sh

#ENTRYPOINT ["./hello.native", "-p", "9000"]
