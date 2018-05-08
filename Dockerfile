FROM ruby:2.4

ADD Geminstall /

# Configure to ever install a ruby gem docs then
# Install the relevant gems and cleanup after
RUN printf "gem: --no-rdoc --no-ri" >> /etc/gemrc && \
    gem install json && \
    gem install bundler

# Enable Unicode
ENV LANG C.UTF-8

# Now do the bundle install. I Split this off to minimize differences between 3 and 4
RUN ./Geminstall
