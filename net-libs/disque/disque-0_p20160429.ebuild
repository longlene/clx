# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit flag-o-matic systemd toolchain-funcs user vcs-snapshot

EGIT_COMMIT="0192ba7e1cda157024229962b7bee1c6e86d771b"

DESCRIPTION="A in-memory, distributed message broker"
HOMEPAGE="https://github.com/antirez/disque"
SRC_URI="https://github.com/antirez/disque/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="+jemalloc tcmalloc test"

DEPEND="
jemalloc? ( dev-libs/jemalloc )
"
RDEPEND="${DEPEND}
test? ( dev-lang/tcl )
"

pkg_setup() {
	enewgroup disque 75
	enewuser disque 75 -1 /var/lib/disque disque
}

src_prepare() {
	epatch "${FILESDIR}"/${P}-shared.patch
	epatch "${FILESDIR}"/${P}-config.patch
	sed -i 's:$(ARCH)::' deps/hiredis/Makefile
}

src_compile() {
	tc-export CC

	local myconf=""
	if use tcmalloc ; then
		myconf="${myconf} USE_TCMALLOC=yes"
	elif use jemalloc ; then
		myconf="${myconf} USE_JEMALLOC=yes"
	fi

	emake ${myconf} V=1 CC="${CC}"
}

src_install() {
	insinto /etc/
	doins disque.conf
	use prefix || fowners disque:disque /etc/disque.conf
	fperms 0644 /etc/disque.conf

	newconfd "${FILESDIR}/disque.confd" disque
	newinitd "${FILESDIR}/disque.initd" disque

	systemd_dounit "${FILESDIR}/disque.service"
	systemd_newtmpfilesd "${FILESDIR}/disque.tmpfiles" disque.conf

	dobin src/disque
	dosbin src/disque-server src/disque-check-aof

	if use prefix; then
		diropts -m0750
	else
		diropts -m0750 -o disque -g disque
	fi
	keepdir /var/{log,lib}/disque
}
