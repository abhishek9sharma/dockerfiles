#docker build --no-cache -t openvscode_image_local .
docker build -t openvscode_image_local .
docker run -it -p 8080:8080 openvscode_image_local
#docker run openvscode_image_local tail -f /dev/null