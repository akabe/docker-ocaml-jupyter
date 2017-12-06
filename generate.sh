#!/bin/bash -eu

function install_jupyter() {
    cat <<'EOF'
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
           $HOME/.opam/$OCAML_VERSION/build
EOF
}

function alpine_scripts() {
    cat <<EOF
RUN sudo apk add --upgrade --no-cache zlib gmp zeromq python3 && \\
    sudo apk add --upgrade --no-cache \\
                 --virtual=.build-dependencies \\
                 curl m4 perl zlib-dev gmp-dev zeromq-dev libffi-dev python3-dev && \\
    \\
$(install_jupyter) && \\
    \\
    sudo apk del .build-dependencies
EOF
}

function centos7_scripts() {
    cat <<EOF
RUN sudo yum install -y epel-release && \\
    sudo yum install -y zlib gmp zeromq python34 \\
                        m4 which perl gcc zlib-devel gmp-devel zeromq-devel python34-devel python34-pip && \\
    \\
$(install_jupyter) && \\
    \\
    sudo yum remove -y m4 which perl gcc zlib-devel gmp-devel zeromq-devel python34-devel python34-pip && \\
    sudo yum clean all
EOF
}

function debian8_scripts() {
    cat <<EOF
RUN sudo apt-get update && \\
    sudo apt-get upgrade -y && \\
    sudo apt-get install -y zlib1g libgmp10 libzmq3 python3 \\
                            m4 pkg-config gcc zlib1g-dev libgmp-dev libzmq3-dev python3-dev python3-pip && \\
    \\
$(install_jupyter) && \\
    \\
    sudo apt-get remove -y m4 pkg-config gcc zlib1g-dev libgmp-dev libzmq3-dev python3-dev python3-pip && \\
    sudo apt-get autoremove -y && \\
    sudo apt-get autoclean
EOF
}

function ubuntu1604_scripts() {
    cat <<EOF
RUN sudo apt-get update && \\
    sudo apt-get upgrade -y && \\
    sudo apt-get install -y zlib1g libgmp10 libzmq5 python3 python3-pip \\
                            m4 pkg-config gcc curl zlib1g-dev libgmp-dev libzmq3-dev libffi-dev python3-dev && \\
    \\
$(install_jupyter) && \\
    \\
    sudo apt-get remove -y m4 pkg-config gcc zlib1g-dev libgmp-dev libzmq3-dev python3-dev python3-pip && \\
    sudo apt-get autoremove -y && \\
    sudo apt-get autoclean
EOF
}

echo "Generating dockerfiles/$TAG/Dockerfile (ALIAS=${ALIAS[@]})..."

rm -rf dockerfiles/$TAG
mkdir -p dockerfiles/$TAG

cat <<EOF > dockerfiles/$TAG/Dockerfile
FROM akabe/ocaml:${TAG}

ENV PATH \$PATH:/home/opam/.local/bin

EOF

if [[ "$TAG" =~ ^alpine ]]; then
    alpine_scripts >> dockerfiles/$TAG/Dockerfile
elif [[ "$TAG" =~ ^centos7 ]]; then
    centos7_scripts >> dockerfiles/$TAG/Dockerfile
elif [[ "$TAG" =~ ^debian8 ]]; then
    debian8_scripts >> dockerfiles/$TAG/Dockerfile
elif [[ "$TAG" =~ ^ubuntu16.04 ]]; then
    ubuntu1604_scripts >> dockerfiles/$TAG/Dockerfile
else
    echo -e "\033[31m[ERROR] Unknown base image: ${TAG}\033[0m"
    exit 1
fi

cat <<'EOF' >> dockerfiles/$TAG/Dockerfile

VOLUME /notebooks
VOLUME /home/opam/.jupyter
WORKDIR /notebooks

COPY entrypoint.sh /
COPY .ocamlinit    /home/opam/.ocamlinit
COPY .jupyter      /home/opam/.jupyter

EXPOSE 8888

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "jupyter", "notebook", "--no-browser", "--ip=*" ]
EOF

cp    entrypoint.sh dockerfiles/$TAG
cp    .ocamlinit    dockerfiles/$TAG
cp -r .jupyter      dockerfiles/$TAG
