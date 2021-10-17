# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/elves/elvish"

DESCRIPTION="A friendly and expressive Unix shell"
HOMEPAGE="https://github.com/elves/elvish"
SRC_URI="https://github.com/elves/elvish/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	golang-build_src_install
	dobin bin/elvish
	dodoc src/${EGO_PN}/README.md
}
