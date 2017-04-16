# Usage

First: A disclaimer. All operations in this script use the force command. That means your config files will be overwritten. I recommend you make a backup first.

./install.rb will run the script to setup all the necessary symlinks.

Make the install file executable with chmod +x ./install.rb

# Install

Download, review, then execute the script:
```
curl --remote-name https://raw.githubusercontent.com/BenR1312/config/master/fresh_start
less fresh_start
sh mac 2>&1 | tee ~/laptop.log
```

# Checklist of other parts to install.

- RVM
  (can enable globalchase $ rvm gemset globalcache enable)
- Brew
  (immediatly update brew after intall just in case)
  (brew install git-extras)
  (brew install git-flow)
- Git
- Gitx
- Postgres

# Postgres install
  (this is only here as a guide to my own personal setup, and is not required by this config.)
  Postgres has setup this is here to hopefully smooth this out for future setup.
  Install with homebrew, install brew services.
  ```
  $ brew tap homebrew/services
  $ brew services start postgresql
  (ensures postgres will start as a background process, if we ever need to stop we can run.)
  $ brew services stop postgresql
  ```

  for setting up postgres for usage with apps, remember to check the database.yml for the app.
  check what users are needed for this to work, it may need just your user and password.
  if not eg it needs
  username: develop
  password: develop

  we can run $ psql template
  and in sql create the required users.
  ```
  CREATE USER develop WITH PASSWORD 'develop';
  ALTER USER develop CREATEDB;
  ALTER USER develop WITH SUPERUSER;
  \q
  ```
