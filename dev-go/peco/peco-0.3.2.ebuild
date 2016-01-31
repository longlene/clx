# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Simplistic interactive filtering tool"
HOMEPAGE="https://github.com/peco/peco"
SRC_URI="mirror://github/peco/peco/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="dev-lang/go"
RDEPEND="${DEPEND}"

src_compile() {
	go build cmd/peco/peco.go
}

src_install() {
	dobin ${PN}
}
