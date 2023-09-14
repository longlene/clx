# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/newhook/go-symbols"
EGIT_COMMIT="b75dfefa0d235b7ad4cc62f3cadbccb3ea0db81f"

DESCRIPTION="A utility for extracting a JSON representation of the package symbols from a go source tree"
HOMEPAGE="https://github.com/newhook/go-symbols"
SRC_URI="https://github.com/newhook/go-symbols/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/go-tools
"
RDEPEND="${DEPEND}"

src_install() {
	dobin go-symbols
	dodoc src/${EGO_PN}/README.md
}
