server {
	listen 80;
	listen [::]:80;
	server_name ${domain} www.${domain};

    root /home/${username}/public_html;

    index index.php index.htm index.html;

    access_log /var/log/nginx/${domain}_access.log;
    error_log /var/log/nginx/${domain}_error.log;

    include snippets/gzip.conf;

location / {
	try_files $uri $uri/ /index.php?$args;
    }

location ~ \.php$ {
		include snippets/fastcgi-php.conf;
		fastcgi_pass unix:/run/php/php7.2-fpm-${username}.sock;

		#increase timeouts
		fastcgi_read_timeout 6000;
		fastcgi_connect_timeout 6000;
		fastcgi_send_timeout 6000;
		proxy_read_timeout 6000;
		proxy_connect_timeout 6000;
		proxy_send_timeout 6000;
		send_timeout 6000;

    }

}
