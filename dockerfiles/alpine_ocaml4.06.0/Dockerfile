FROM akabe/ocaml:alpine_ocaml4.06.0

ENV PATH $PATH:/home/opam/.local/bin

RUN sudo apk add --upgrade --no-cache zlib gmp zeromq python3 && \
    sudo apk add --upgrade --no-cache \
                 --virtual=.build-dependencies \
                 curl m4 perl zlib-dev gmp-dev zeromq-dev libffi-dev python3-dev && \
    \
    sudo pip3 install --upgrade pip && \
    pip3 install --user --no-cache-dir 'setuptools>=18.5' 'six>=1.9.0' jupyter && \
    mkdir -p /home/opam/.jupyter && \
    \
    opam update && \
    opam install -y 'merlin>=3.0.0' ocaml-migrate-parsetree jupyter && \
    jupyter kernelspec install --user --name ocaml-jupyter "$(opam config var share)/jupyter" && \
    \
    rm -rf $HOME/.opam/archives \
           $HOME/.opam/repo/default/archives \
           $HOME/.opam/$OCAML_VERSION/man \
           $HOME/.opam/$OCAML_VERSION/build && \
    \
    sudo apk del .build-dependencies

VOLUME /notebooks
VOLUME /home/opam/.jupyter
WORKDIR /notebooks

COPY entrypoint.sh /
COPY .ocamlinit    /home/opam/.ocamlinit
COPY .jupyter      /home/opam/.jupyter

EXPOSE 8888

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "jupyter", "notebook", "--no-browser", "--ip=*" ]
