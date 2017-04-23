# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_PN="github.com/elliotchance/c2go"

inherit golang-build golang-vcs-snapshot

DESCRIPTION="A tool for converting C to Go"
HOMEPAGE="https://github.com/elliotchance/c2go"
SRC_URI="https://github.com/elliotchance/c2go/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sys-devel/clang
"

src_install() {
	dobin c2go
	dodoc src/${EGO_PN}/README.md
}
