# apiaxle-cookbook

[![Build Status](https://circleci.com/gh/mapzen/chef-apiaxle.svg?style=svg)](https://circleci.com/gh/mapzen/chef-apiaxle)

Installs ApiAxle in whole or in part

## Usage

### apiaxle::default

Installs the ApiAxle api, proxy and web admin interface.
The admin interface can be accessed via [localhost](http://localhost:8000)

### apiaxle::api

Installs only the ApiAxle api and dependencies.

### apiaxle::proxy

Installs only the ApiAxle proxy and dependencies.

To add an individual proxy:
`nginx_api_proxy 'some api name'`

### apiaxle::web_admin

Installs only the web admin interface and dependencies.

## License and Authors

Author:: Baldur Gudbjornsson (baldur@mapzen.com)
