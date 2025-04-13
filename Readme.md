# How to use?

## Build docker Image

docker build -t cam-screenshot-download .

## RUN

docker run --restart=always -d -v $(pwd)/cam1:/app/screenshots -e "RTSP_URL=rtsp://admin:123456@192.168.1.2/live/profile.0" cam-screenshot-download 
