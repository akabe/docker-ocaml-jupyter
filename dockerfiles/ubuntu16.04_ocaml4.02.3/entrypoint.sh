#!/bin/sh

sudo chown -hR opam:opam /home/opam/.jupyter
sudo chown -hR opam:opam /notebooks
opam config exec -- "$@"
