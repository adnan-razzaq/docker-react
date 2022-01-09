# Mutli step build procees for production level
#Build phase
#Run phase

#build phase
FROM node:16-alpine as builder

WORKDIR "/app"

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

#RUN phase
FROM nginx:alpine

#copy everything from container
COPY --from=builder /app/build /usr/share/nginx/html
