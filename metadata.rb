name             'apiaxle'
maintainer       'Baldur Gudbjornsson'
maintainer_email 'baldur@mapzen.com'
license          'GPL v3'
description      'Installs/Configures apiaxle'
long_description 'Installs/Configures apiaxle'
version          '0.1.0'

recipe 'apiaxle', 'Installs apiaxle'

depends 'apt'
depends 'git'
depends 'user'
depends 'ulimit'
depends 'nodejs',   '~> 2.2.0'
depends 'redisio',  '~> 2.2.4'
depends 'runit',    '~> 1.5.14'

supports 'ubuntu', '>= 12.04'
