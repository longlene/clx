# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/goccmack/gocc"
EGIT_COMMIT="10ad5bddf74170b855613580fec12646cdd3791a"

DESCRIPTION="Parser / Scanner Generator"
HOMEPAGE="https://github.com/goccmack/gocc"
SRC_URI="https://github.com/goccmack/gocc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	golang-build_src_install
	dobin bin/gocc
}
