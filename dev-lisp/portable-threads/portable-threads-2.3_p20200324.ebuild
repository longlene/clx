# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="aa26bf38338a6b068bf8bfb3375d8d8c3b0a28df"

DESCRIPTION="Portable threads API for Common Lisp"
HOMEPAGE="https://github.com/binghe/portable-threads"
SRC_URI="https://github.com/binghe/portable-threads/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem :portable-threads\/test/,$' ${PN}.asd
		rm -rf test
	fi
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all COPYING LICENSE
}
