FROM akabe/ocaml:ubuntu16.04_ocaml4.03.0

ENV PATH $PATH:/home/opam/.local/bin

RUN sudo apt-get update && \
    sudo apt-get upgrade -y && \
    sudo apt-get install -y zlib1g libgmp10 libzmq5 python3 python3-pip \
                            m4 pkg-config gcc curl zlib1g-dev libgmp-dev libzmq3-dev libffi-dev python3-dev && \
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
    sudo apt-get remove -y m4 pkg-config gcc zlib1g-dev libgmp-dev libzmq3-dev python3-dev python3-pip && \
    sudo apt-get autoremove -y && \
    sudo apt-get autoclean

VOLUME /notebooks
VOLUME /home/opam/.jupyter
WORKDIR /notebooks

COPY entrypoint.sh /
COPY .ocamlinit    /home/opam/.ocamlinit
COPY .jupyter      /home/opam/.jupyter

EXPOSE 8888

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "jupyter", "notebook", "--no-browser", "--ip=*" ]
