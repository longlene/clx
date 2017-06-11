# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

DESCRIPTION="A library that provides an embeddable, persistent key-value store for fast storage"
HOMEPAGE="http://rocksdb.org"
SRC_URI="https://github.com/facebook/${PN}/archive/v${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+java"

RDEPEND="
	dev-cpp/gflags
	app-arch/snappy
	sys-libs/zlib
	app-arch/bzip2
	java? ( virtual/jdk )
"
DEPEND="
		${RDEPEND}"

src_compile() {
	emake shared_lib all

	if use java ; then
		emake -j1 rocksdbjava
	fi
}

src_install() {
	emake INSTALL_PATH="${D}/usr" install
	dodoc README.md

	if use java ; then
		insinto /usr/lib/${PN}
		doins java/target/rocksdbjni-${PV}-linux$(getconf LONG_BIT).jar
	fi
}
