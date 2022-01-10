#!/bin/bash
ver=$(docker images | awk '($1 == "kubernetes-test") {print $2 += .01; exit}')
dirname=${PWD##*/}
#my oracle cloud repo, its private don't bother trying
repo="sjc.ocir.io/axhsqvkgyqb7"
docker build -t "$dirname":"$ver" .
docker tag library/"$dirname":"$ver" $repo/kubernetes-test:"$ver"
docker push $repo/"$dirname":"$ver"
echo "$ver"
