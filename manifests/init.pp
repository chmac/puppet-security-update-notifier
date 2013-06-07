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

	file { '/usr/bin/security-update-notifier.sh':
		mode			=> 664,
		source			=> 'puppet:///modules/security_update_notifier/src/security-update-notifier.sh',
	}

	cron { 'security-update-notifier':
		command			=> '/usr/bin/security-update-notifier.sh',
		hour			=> 4,
		minute			=> 44,
	}

}
