# Copyright 1999-2017 Tiziano Müller
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit user vcs-snapshot

EGIT_COMMIT="21055550f3392235a1b41d71257e9dc9ead0dfa0"

DESCRIPTION="A Layer Two Peer-to-Peer VPN"
HOMEPAGE="http://www.ntop.org/n2n/"
SRC_URI="https://github.com/ntop/n2n/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

pkg_setup() {
	enewgroup n2n
	enewuser n2n -1 -1 /var/empty n2n
}

src_prepare() {
	eapply_user
	sed -e 's|$(CC) $(CFLAGS)|\0 $(LDFLAGS)|' \
		-i Makefile || die "sed failed"
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc HACKING README.md

	keepdir /var/log/n2n
	fowners n2n:n2n /var/log/n2n

	newconfd "${FILESDIR}/supernode.confd" supernode
	newinitd "${FILESDIR}/supernode.initd" supernode
	newconfd "${FILESDIR}/edge.confd" edge
	newinitd "${FILESDIR}/edge.initd" edge
}

