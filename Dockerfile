#Based on https://github.com/GeoBigData/geopandas-base/blob/master/python36/Dockerfile
FROM python:3.9

# Install the C compiler tools
RUN apt-get update -y && \
  apt-get install build-essential -y && \
  pip install --upgrade pip

# Install libspatialindex
WORKDIR /tmp
RUN wget http://download.osgeo.org/libspatialindex/spatialindex-src-1.8.5.tar.gz && \
  tar -xvzf spatialindex-src-1.8.5.tar.gz && \
  cd spatialindex-src-1.8.5 && \
  ./configure && \
  make && \
  make install && \
  cd - && \
  rm -rf spatialindex-src-1.8.5* && \
  ldconfig