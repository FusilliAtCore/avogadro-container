export XSOCK=/tmp/.X11-unix
export XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run -it --rm \
       --volume=$XSOCK:$XSOCK:rw \
       --volume=$XAUTH:$XAUTH:rw \
       --volume=./data:/home/avogadro/data:rw \
       --env="XAUTHORITY=${XAUTH}" \
       --env="DISPLAY" \
       --env="QT_X11_NO_MITSHM=1" \
       avogadro12
