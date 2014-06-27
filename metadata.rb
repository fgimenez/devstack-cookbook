name             'devstack_cookbook'
maintainer       'Federico Gimenez Nieto'
maintainer_email 'fgimenez@coit.es'
license          'Apache-2.0'
description      'Installs/Configures devstack'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'apt'

supports 'ubuntu'
