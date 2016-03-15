# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="Yet Another Serialization"
HOMEPAGE="https://github.com/niXman/yas"
SRC_URI=""

EGIT_REPO_URI="https://github.com/niXman/yas.git"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins -r include/${PN}
	dodoc README.md
}
