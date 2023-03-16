FROM alpine

ENV TZ=America/Mexico_City
RUN ln -snf /user/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apk add --update nodejs npm

RUN set -x \
    && apk update \
    && apk upgrade \
    && apk add --no-cache \
    udev \
    ttf-freefont \
    chromium

COPY . .

RUN npm install
RUN npm rebuild node-sass

CMD [ "npm", "run", "start" ]
