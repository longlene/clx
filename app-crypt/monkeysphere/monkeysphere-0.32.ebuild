# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

MY_P="${P/-/_}"
DESCRIPTION="use the OpenPGP web of trust to verify ssh connections"
HOMEPAGE="http://web.monkeysphere.info/"
SRC_URI="http://archive.monkeysphere.info/debian/pool/monkeysphere/m/monkeysphere/${MY_P}.orig.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RESTRICT="test" # ssh connection failed

RDEPEND="app-crypt/gnupg
	dev-perl/Crypt-OpenSSL-Bignum
	dev-perl/Crypt-OpenSSL-RSA
	virtual/perl-Digest-SHA
	virtual/perl-MIME-Base64
	net-misc/openssh
	net-misc/socat
	|| (
		app-misc/lockfile-progs
		mail-filter/procmail
	)"
DEPEND="test? ( ${DEPEND} )"

src_install() {
	emake install DESTDIR="${D}" || die
	rm -rf "${ED}usr/share/doc/${PN}" || die

	dodoc Changelog README || die
	docinto examples || die
	dodoc examples/* || die
}

pkg_postinst() {
	elog "Monkeysphere ssh config stanza (for ~/.ssh/config or /etc/ssh_config)"
	elog "This checks for host keys in the OpenPGP WoT:"
	elog ""
	elog "Host *"
	elog "ProxyCommand monkeysphere ssh-proxycommand %h %p"
	elog ""
}
