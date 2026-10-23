FROM nginx:alpine

COPY  . /usr/share/nginx/html/

EXPOSE 80
# docker build -t nombre .  //para crear un img
# docker run -d -p puerto:80 nombre //para correr un servidor local en puerto se pone el numero que se busca el el local host
