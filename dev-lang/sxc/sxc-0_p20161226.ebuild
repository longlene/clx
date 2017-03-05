# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="7cb07881565d005a2a46ca3a44d8330e44e09076"

DESCRIPTION="S-Expression C"
HOMEPAGE="https://github.com/burtonsamograd/sxc"
SRC_URI="https://github.com/burtonsamograd/sxc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-lisp/sbcl
"
RDEPEND="${DEPEND}"

src_install() {
	dobin sxc
	dodoc README.md
}
