#!/bin/bash
# OSRM Backend

apt install build-essential git cmake pkg-config libbz2-dev libstxxl-dev libstxxl1v5 libxml2-dev libzip-dev libboost-all-dev lua5.2 liblua5.2-dev libtbb-dev npm git cmake make wget -y
cd /root
git clone https://github.com/Project-OSRM/osrm-backend.git
cd /root/osrm-backend
git checkout v5.27.1
mkdir -p /root/osrm-backend/build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
cmake --build .
cmake --build . --target install
cd /root/osrm-backend
wget https://download.geofabrik.de/europe/turkey-latest.osm.pbf
osrm-extract turkey-latest.osm.pbf
osrm-partition turkey-latest.osrm
osrm-customize turkey-latest.osrm
