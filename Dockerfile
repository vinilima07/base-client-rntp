FROM node:16.13.1

# create app directory
WORKDIR /usr/src/app

# copy app
COPY . .

# install required lib
RUN npm install --only=production
RUN npm run predeploy:docker
RUN npm run build

# expose listening ports
EXPOSE 3000

CMD ["npm", "run", "deploy:docker"]

