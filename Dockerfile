FROM node:20.12.0-alpine3.19  
# above  step is selecting a base image which is a simple node.js image....

WORKDIR /usr/src/app
# Above step is selecting a working directory which is you can select any directory (or) you can select any path

COPY package.json package-lock.json turbo.json tsconfig.json ./
# Above step is copy all the configuration files....

COPY apps ./apps
# Above step is copy the app folder as well as the packages folder....
# If you are using a mono repo your app folder will have there own package.json's
COPY packages ./packages
# Also the packages folder will have it's own package.json file so you have to seperately write COPY statement for
# every separate folder in a mono repo....

# Install dependencies
RUN npm install
# Can you add a script to the global package.json that does this?
RUN npm run db:generate

# Can you filter the build down to just one app?
RUN npm run build

CMD ["npm", "run", "start-user-app"]