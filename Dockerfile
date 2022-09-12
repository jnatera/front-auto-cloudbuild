FROM node:14-alpine AS BUILDER

WORKDIR /usr/src/app

COPY package.json ./

ARG API_URL
ARG HAS_LOGIN
ARG LOGIN_URL

ENV API_URL=$API_URL
ENV HAS_LOGIN=$HAS_LOGIN
ENV LOGIN_URL=$LOGIN_URL

RUN npm install

COPY . .

RUN npm run build-prod

FROM nginx:alpine

COPY nginx.conf /etc/nginx/conf.d/configfile.template

ENV PORT 8080
ENV HOST 0.0.0.0

RUN sh -c "envsubst '\$PORT' < /etc/nginx/conf.d/configfile.template > /etc/nginx/conf.d/default.conf"

COPY --from=BUILDER /usr/src/app/dist/app-test /usr/share/nginx/html

EXPOSE $PORT

CMD ["nginx", "-g", "daemon off;"]
