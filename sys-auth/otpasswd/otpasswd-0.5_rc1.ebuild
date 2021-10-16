# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=7

inherit cmake eutils pam

DESCRIPTION="One-Time Passwords auth module for PAM"
HOMEPAGE="http://savannah.nongnu.org/projects/otpasswd"
SRC_URI="http://thera.be/my_public/my_projects/otpasswd/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="virtual/pam dev-libs/gmp"
DEPEND="${RDEPEND} dev-util/cmake"

RESTRICT=test

src_install() {
	cmake_src_install
	dodoc README INSTALL || die "unable to install docs"

	# Change utility and directory owner
	fowners otpasswd:root /etc/otpasswd || die "Unable to set permissions"

	# Set it to be SUID-root as most universal configuration.
	fperms 4511 /usr/bin/otpasswd

	insinto /etc/otpasswd
	newins examples/otpasswd.conf.dist otpasswd.conf

	# Readable only by root. (For easy switching to MySQL/LDAP modes)
	fperms 0600 /etc/otpasswd/otpasswd.conf /etc/otpasswd/otpasswd.conf.dist
}

pkg_setup() {
	# Create user the utility will be run as
	enewuser otpasswd
}

pkg_postinst() {
	elog "To use ppp-pam for SSH authentication you might want to update"
	elog "/etc/pamd.d/sshd so that the following line:"
	elog "auth    include    system-remote-login"
	elog "is replaced with:"
	elog "auth    include    otpasswd-login"
	elog "Also make sure that UsePAM and ChallengeResponseAuthentication"
	elog "options are enabled inside your /etc/sshd/sshd_config"
	elog
	elog "For a more complete description of possible configurations,"
	elog "see the README and INSTALL in /usr/share/doc/otpasswd*"
}
