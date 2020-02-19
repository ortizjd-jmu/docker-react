# Build Phase
FROM node:alpine as builder 

WORKDIR '/app'

COPY package.json . 
RUN npm install

COPY . .

RUN npm run build

# run Phase
FROM nginx as run
# copy something from other phase
COPY --from=builder /app/build /usr/share/nginx/html

