class sudoers ($sudoers) {
	package { "sudo": }
	
	File { require => Package["sudo"] }

	file { "/etc/sudoers":
			mode =>	"440",
			owner => 'root',
			group => 'root',
			content => template("sudo/sudoers.erb");
			"/usr/bin/sudo":
		    mode    => "4111";
		    "/usr/sbin/visudo":
		    mode    => "755";
	}
}
