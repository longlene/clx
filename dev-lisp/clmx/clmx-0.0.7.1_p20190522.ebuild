# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d8ee3f54d1dfe688e214ed58c6d9a3e8e434cf56"

DESCRIPTION="Matrix manipulation library for Common Lisp"
HOMEPAGE="https://github.com/akai7000/clmx"
SRC_URI="https://github.com/akai7000/clmx/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
		sed -i '/defsystem #:clmx\/test/,$d' ${PN}.asd
		rm -r test
	fi
}
