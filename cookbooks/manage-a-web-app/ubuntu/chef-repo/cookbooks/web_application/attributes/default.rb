default['web_application']['user'] = 'web_admin'
default['web_application']['group'] = 'web_admin'

default['web_application']['name'] = 'customers'
default['web_application']['config'] = 'customers.conf'

default['apache']['docroot_dir'] = '/srv/apache/customers'

default['mysql']['server_root_password'] = 'learnchef_mysql'

default['web_application']['database']['dbname'] = 'products'
default['web_application']['database']['host'] = '127.0.0.1'
default['web_application']['database']['username'] = 'root'
default['web_application']['database']['password'] = node['mysql']['server_root_password']

default['web_application']['database']['app']['username'] = 'db_admin'
default['web_application']['database']['app']['password'] = 'customers_password'

default['web_application']['database']['seed_file'] ='/tmp/create-tables.sql'
