Oma rakenduse laadimine production serverisse
=============

1. Saada juhendajale (tanel ätt fortumo.com) oma SSH avalik võti. Tavaliselt on see fail `~/.ssh/id_rsa.pub` või `~/.ssh/id_dsa.pub`

2. Juhendaja saadab vastu serverisse sisselogimiseks vajalikud andmed.

3. Oma rails'i applikatsiooni serveris tööle logi serverisse sisse ja järgi järgmiseid juhiseid.

Oma masinas
-------

Gemfile'i tuleb lisada JS keskkond, selleks saab gemi 'therubyracer'


Serveris
-------

#### 1. Tõmba alla applikatsiooni lähtekood 

    cd apps
    
Kui kasutad Git'i siis:

    git clone REPO_AADRESS
või Mercurial'i puhul
    hg clone REPO_AADRESS


#### 2. Installeeri vajalikud Ruby Gemid

    cd app_name 
    bundle install --deployment

#### 3. Muuda andmebaasi konfiguratsiooni

ava konfiguratsioonifail ja lisa sinna "production" keskkonna konf.

    nano config/database.yml

Kui kasutad Postgresqli:

    production:
      adapter: postgresql
      encoding: utf8
      database: KASUTAJANIMI_APP_NAME_production # toomas_blog_production
      pool: 5
      username: KASUTAJANIMI # toomas
      password: # selle leiad serverist oma kodukataloogis olevast failist 'postgres_pwd'

 või Mysql'i korral:

    production:
      adapter: mysql
      encoding: utf8
      database: KASUTAJANIMI_APP_NAME_production # toomas_blog_production
      pool: 5
      username: KASUTAJANIMI # toomas
      password: # selle leiad serverist oma kodukataloogis olevast failist 'mysql_pwd'
      
Postgresql puhul on vaja lisada Gemfile sisse rida "gem 'pg"', mysql puhul "gem 'mysql2'"

#### 4. Loo andmebaas, kasutades `rake` taski

    rake db:create RAILS_ENV=production
    
#### 5. Sisesta andmebaasi schema ja andmed migrtsioonide abil
    
    bundle exec rake db:migrate RAILS_ENV=production
    
#### 6. Käivita Ruby veebiserveri protsess

    bundle exec thin start -p PORDI_NUMBER
    
#### 7. Kontrolli, kas rakendus on veebibrauseriga kasutatav

ava `http://SERVERI_IP_AADRESS:PORDI_NUMBER`
