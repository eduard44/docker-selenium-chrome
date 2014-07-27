FROM eduard44/vertex

# Update apt-get
RUN apt-get update

RUN apt-get install -y --force-yes libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev build-essential g++ socat

# Install Chrome
RUN apt-get install -y --force-yes libxss1 libappindicator1 libindicator7

RUN wget --no-check-certificate -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

RUN echo deb http://dl.google.com/linux/chrome/deb/ stable main >> /etc/apt/sources.list.d/google-chrome.list
RUN apt-get update
RUN apt-get install -y openjdk-7-jre-headless google-chrome-stable xvfb

# Install protractor
RUN npm install -g protractor

RUN webdriver-manager update

# Add config
ADD ./docker /
RUN chmod ugo+x /etc/init.d/xvfb
RUN chmod ugo+x /usr/local/bin/start-selenium.sh
