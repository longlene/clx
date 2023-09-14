# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd toolchain-funcs vcs-snapshot

EGIT_COMMIT="27b17889a43e32b0c1162514d00967e6967d41bb"

DESCRIPTION="Transparent redirector of any TCP connection to proxy"
HOMEPAGE="http://darkk.net.ru/redsocks/"
SRC_URI="https://github.com/darkk/${PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0 LGPL-2.1+ ZLIB"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="doc"
RESTRICT="test"

DEPEND="dev-libs/libevent:0="
RDEPEND="
	${DEPEND}
	acct-group/redsocks
	acct-user/redsocks
	net-firewall/iptables
"

src_compile() {
	CC="$(tc-getCC)" emake
}

src_install() {
	dosbin redsocks
	doman debian/redsocks.8
	use doc && dodoc README doc/*
	insinto /etc
	newins debian/redsocks.conf redsocks.conf

	newinitd "${FILESDIR}"/redsocks.init redsocks
	newconfd "${FILESDIR}"/redsocks.conf redsocks

	systemd_dounit "${FILESDIR}"/redsocks.service
}
