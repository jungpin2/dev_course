#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/jungpin/catkin_ws/src/sim_ws/src/chapter10/turtle_tf_3d"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/jungpin/catkin_ws/src/sim_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/jungpin/catkin_ws/src/sim_ws/install/lib/python2.7/dist-packages:/home/jungpin/catkin_ws/src/sim_ws/build/turtle_tf_3d/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/jungpin/catkin_ws/src/sim_ws/build/turtle_tf_3d" \
    "/usr/bin/python2" \
    "/home/jungpin/catkin_ws/src/sim_ws/src/chapter10/turtle_tf_3d/setup.py" \
     \
    build --build-base "/home/jungpin/catkin_ws/src/sim_ws/build/turtle_tf_3d" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/jungpin/catkin_ws/src/sim_ws/install" --install-scripts="/home/jungpin/catkin_ws/src/sim_ws/install/bin"
