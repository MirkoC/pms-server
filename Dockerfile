FROM ruby:2.2

RUN adduser --disabled-password --gecos "" pms

ENV APP_USER pms
ENV APP_HOME /pms

RUN adduser $APP_USER sudo
RUN mkdir $APP_HOME && chown -R $APP_USER. /$APP_HOME

WORKDIR $APP_HOME
# USER $APP_USER

ADD Gemfile* $APP_HOME/
RUN bundle install
ADD . $APP_HOME

EXPOSE 4567

CMD ruby $APP_HOME/server.rb
