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
      - 8080:4000
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

### Udate the site with the newly added content

After adding a new `markdown` file with the new content, you need only to pull the new content from Github repo and rebuild the site with `docker-compose`:

```
git pull
docker-compose exec site jekyll build
```

and now, you are serving the newly created content. Of course, putting this in cronjob is better.

## Set up nginx

In the example above docker-compose file has port ```8080``` used as Jekyll's HTTP port. Nginx's ```.conf``` file should be similar to this:

```
server {
    server_name    cernivec.si www.cernivec.si;
    listen         80;
    listen         [::]:80;

  location / {
      proxy_set_header Host $host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_pass http://localhost:8080;
  }

}
```
Put the file under ```conf.d``` directory.

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

## Post Jekyll setup

### Serve the site via HTTPS (Let's Encrypt)

Check out these tutorials on how to set-up Let's Encrypt: https://linuxize.com/post/secure-nginx-with-let-s-encrypt-on-centos-7/
