FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  npm i pm2 -g && \
  rm -rf /var/lib/apt/lists/*
  
RUN git clone https://github.com/ITACHI-MD-pixel/ITACHI_x_RAGE  /root/ITACHI-MD-pixel 
WORKDIR /root/ITACHI-MD-pixel/


COPY package.json .
RUN npm install pm2 -g
RUN npm install --legacy-peer-deps

COPY . .

EXPOSE 3000

CMD ["npm","start" ]
