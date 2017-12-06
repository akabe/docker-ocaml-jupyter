FROM akabe/ocaml:centos7_ocaml4.02.3

ENV PATH $PATH:/home/opam/.local/bin

RUN sudo yum install -y epel-release && \
    sudo yum install -y zlib gmp zeromq python34 \
                        m4 which perl gcc zlib-devel gmp-devel zeromq-devel python34-devel python34-pip && \
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
    sudo yum remove -y m4 which perl gcc zlib-devel gmp-devel zeromq-devel python34-devel python34-pip && \
    sudo yum clean all

VOLUME /notebooks
VOLUME /home/opam/.jupyter
WORKDIR /notebooks

COPY entrypoint.sh /
COPY .ocamlinit    /home/opam/.ocamlinit
COPY .jupyter      /home/opam/.jupyter

EXPOSE 8888

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "jupyter", "notebook", "--no-browser", "--ip=*" ]
