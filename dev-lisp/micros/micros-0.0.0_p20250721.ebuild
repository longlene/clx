# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7bb942a39682d4c70b772312147287d465dd13c8"

DESCRIPTION="Micro slime/swank with forked SLIME"
HOMEPAGE="https://github.com/lem-project/micros"
SRC_URI="https://github.com/lem-project/micros/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	if use !test ; then
		sed -e '/defsystem "micros\/tests",$d' \
			-i ${PN}.asd
		rm -rf contrib/walker/tests
	fi
}
