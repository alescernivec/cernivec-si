# cernivec-si
My homepage

## Run the site with Docker 

Check out: https://github.com/envygeeks/jekyll-docker

Next section is taken out of the site aboove.

### Docker-Compose

```yml
version: "3"
services:
  site:
    command: jekyll serve
    image: jekyll/jekyll:latest
    volumes:
      - $PWD:/srv/jekyll
      - $PWD/vendor/bundle:/usr/local/bundle
    ports:
      - 4000:4000
      - 35729:35729
      - 3000:3000
      -   80:4000
```

#### Usage

**1.** Create site:

```sh
docker-compose run site jekyll new mysite
```

**2.** Change to the new site's folder:

```sh
cd mysite
```

**3.** Initial build and serve:

```sh
docker-compose up -d
```

While running with above command you can:

Build again (for apply `_config.yml` file):
```sh
docker-compose exec site jekyll build
```

**Note:** If you want to create another site, then you have to stop the container, change to docker-compose's root folder and repeat the steps above.

```sh
docker-compose stop
cd ..
```

and back to **1**.

## Installation - self-hosted

Installation of jekyll:
```
   sudo apt-get install ruby
   sudo gem install mkmf
   sudo apt-get install ruby1.9.1-dev
   sudo gem install jekyll
```
Usage

```
   jekyll b
   jekyll s
```
