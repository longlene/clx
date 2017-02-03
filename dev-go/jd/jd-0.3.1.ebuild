# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/tidwall/jd/..."

DESCRIPTION="Interactive JSON Editor"
HOMEPAGE="https://github.com/tidwall/jd"
SRC_URI="https://github.com/tidwall/jd/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	golang-build_src_install
	dobin bin/jd
	dodoc src/${EGO_PN%/*}/README.md
}
