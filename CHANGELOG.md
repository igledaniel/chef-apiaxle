Changelog
=========

0.1.6
-----
* support for external traffic processors for proxy_event_subscriber
* proxy now running without -q so it hands traffic to proxy_event_subscriber
* proxy requires git
* proxy and proxy_event_subscriber restart on new version
* proxy_event_subscriber restarts on new external processor version

0.1.5
-----
* override default (slightly broken) nginx init script
* update Berksfile: no longer require opsworks nginx cookbook
* berks update

0.1.4
-----
* bump runit dep

0.1.3
-----
* bump version, build resolver from /etc/resolv.conf

0.1.2
-----
* Add support to install npm packages from custom url

0.1.1
-----
* pass include file option into nginx template

0.1.0
-----
* initial commit chef-apiaxle
