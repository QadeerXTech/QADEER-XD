FROM node:18-bullseye

WORKDIR /app

RUN apt-get update && \
    apt-get install -y ffmpeg webp && \
    rm -rf /var/lib/apt/lists/*

COPY package.json yarn.lock* ./

RUN npm install -g yarn && yarn install --network-concurrency 1

COPY . .

ENV NODE_ENV=production

CMD ["npm", "start"]
