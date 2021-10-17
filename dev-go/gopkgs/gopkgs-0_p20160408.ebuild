# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/tpng/gopkgs"
EGIT_COMMIT="01f44316de4b24a2ec9ce0a792e3de1e1499b018"

DESCRIPTION="Command gopkgs list your installed Go packages for import"
HOMEPAGE="https://github.com/tpng/gopkgs"
SRC_URI="https://github.com/tpng/gopkgs/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin gopkgs
	dodoc src/${EGO_PN}/README.md
}
