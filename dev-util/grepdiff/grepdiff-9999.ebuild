# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit git-r3

DESCRIPTION="grep for diffs"
HOMEPAGE="https://github.com/rsc/grepdiff"

EGIT_REPO_URI="https://github.com/rsc/grepdiff.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}"

src_compile() {
	go build -o ${PN} *.go
}

src_install() {
	dobin grepdiff
	dodoc README.md
}
