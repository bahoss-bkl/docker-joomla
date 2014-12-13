#!/bin/bash

TARG=/etc/clusterconfig.php
if [ ! -f $TARG ]; then
	echo "Generating $TARG..."
	cat >$TARG <<EOL
<?php
define('DB_HOST', '$DB_PORT_3306_TCP_ADDR');
define('DB_USER', 'admin');
define('DB_PASSWD', '$DB_PASSWD');
define('JOOMLA_LIVESITE', '$JOOMLA_LIVESITE');
?>
EOL
fi

chown www-data:www-data /var/www -R
source /etc/apache2/envvars
exec apache2 -D FOREGROUND
