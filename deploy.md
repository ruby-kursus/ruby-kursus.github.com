
1. Saada juhendajale oma SSH avalik võti. Tavaliselt on see fail ~/.ssh/id_rsa.pub või ~/.ssh/id_dsa.pub

2. Juhendaja saadab vastu serverisse sisselogimise juhised

3. Oma railsi applikatsiooni serveris tööle logi serverisse sisse ja järgi jägmiseid juhiseid



1. Tõmba alla applikatsiooni lähtekood 

cd apps

git clone REPO_AADRESS

või

hg clone REPO_AADRESS



2. Installeeri vajalikud Ruby Gemid

cd app_name 
bundle install

3. Muuda andmebaasi konfiguratsiooni

ava konfiguratsioonifail ja lisa sinna "production" keskkonna konf.

nano config/database.yml

Postgresql:

production:
  adapter: postgresql
  encoding: utf8
  database: KASUTAJANIMI_APP_NAME_production # toomas_blog_production
  pool: 5
  username: KASUTAJANIMI # toomas
  password: # selle leiad serverist oma kodukataloogis olevast failist 'postgres_pwd'

Mysql:

production:
  adapter: mysql
  encoding: utf8
  database: KASUTAJANIMI_APP_NAME_production # toomas_blog_production
  pool: 5
  username: KASUTAJANIMI # toomas
  password: # selle leiad serverist oma kodukataloogis olevast failist 'mysql_pwd'
