FROM ruby:3.3-alpine AS build
WORKDIR /site

RUN apk add --no-cache build-base git

COPY Gemfile Gemfile.lock ./
RUN bundle config set without 'development test' \
 && bundle install --jobs 4 --retry 3

COPY . .
ENV JEKYLL_ENV=production
RUN bundle exec jekyll build

FROM nginxinc/nginx-unprivileged:1.27-alpine
COPY deploy/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /site/_site /usr/share/nginx/html
EXPOSE 8080