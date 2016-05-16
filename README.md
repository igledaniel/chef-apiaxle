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

### Blocking IPs

If your installation is not behind some sort of proxy, you can simply provide an array of IPs and/or
subnets you wish to block: `node[:apiaxle][:proxied][:blocked_ips]`.

If your installation is behind a proxy, in addition to the above, you will need to override
`node[:apiaxle][:proxied][:real_ip_from]`, which is the trusted network from which you will infer
originating IPs based on X-Forwarded-For. For example, if you're hosted in AWS and have a VPC on a
192.168.0.0/16 subnet, you would set the attribute as such.

## License and Authors

Author:: Baldur Gudbjornsson (baldur@mapzen.com)
