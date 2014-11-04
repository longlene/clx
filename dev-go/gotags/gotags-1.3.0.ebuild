# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="ctags-compatible tag generator for Go"
HOMEPAGE="https://github.com/jstemmer/gotags"
SRC_URI="https://github.com/jstemmer/gotags/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lang/go"

src_compile() {
	go build -o ${PN}
}

src_install() {
	dobin ${PN}
}
