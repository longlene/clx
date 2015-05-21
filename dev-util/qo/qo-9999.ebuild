# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="Another build system for C/C++"
HOMEPAGE="https://github.com/andlabs/qo"
SRC_URI=""

EGIT_REPO_URI="https://github.com/andlabs/qo.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
dev-lang/go
"
RDEPEND="${DEPEND}"

src_compile() {
	go build -o ${PN} || die "compile failed"
}

src_install() {
	dobin qo
	dodoc README.md
}
