FROM node:12.2.0

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY package.json /app/package.json
RUN if [ "$NODE_ENV" = "development" ]; \
	then npm install;  \
	else npm install --only=production; \
	fi

RUN npm install -g @angular/cli@7.3.9

COPY . /app

CMD ng serve --host 0.0.0.0


