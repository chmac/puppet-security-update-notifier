# Class: security_update_notifier
#
# This module manages security_update_notifier
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# class { 'security_update_notifier': }
#
# [Remember: No empty lines between comments and class definition]
class security_update_notifier {

	package { 'sun-update-notifier-common':
		name			=> 'update-notifier-common',
	}

	file { '/usr/bin/security-update-notifier.sh':
		mode			=> 755,
		source			=> 'puppet:///modules/security_update_notifier/src/security-update-notifier.sh',
		require			=> Package['sun-update-notifier-common'],
	}

	cron { 'security-update-notifier':
		command			=> '/usr/bin/security-update-notifier.sh',
		hour			=> 4,
		minute			=> 44,
		require			=> File['/usr/bin/security-update-notifier.sh'],
	}

}
