FROM ruby:2.5.1

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y mysql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs

RUN mkdir /myPortfolio
WORKDIR /myPortfolio
COPY Gemfile /myPortfolio/Gemfile
COPY Gemfile.lock /myPortfolio/Gemfile.lock

RUN gem install bundler -v 1.3.0
RUN bundle install

ADD . /myPortfolio