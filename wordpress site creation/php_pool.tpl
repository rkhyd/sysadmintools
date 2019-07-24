[${username}]
user					= ${username}
group					= ${username}
listen					= /run/php/php7.2-fpm-${username}.sock
listen.owner				= www-data
listen.group				= www-data
php_admin_value[disable_functions]	= exec,passthru,shell_exec,system
php_admin_flag[allow_url_fopen]		= off
pm					= static
pm.max_children				= 5
pm.start_servers			= 2
pm.min_spare_servers			= 1
pm.max_spare_servers			= 3
chdir					= /
