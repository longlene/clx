# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="707f51341581eb9031da7fb9326d074589f376df"

DESCRIPTION="C++ template library for fans of functional programming"
HOMEPAGE="https://github.com/beark/ftl"
SRC_URI="https://github.com/beark/ftl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr
	doins -r include
	dodoc README.md
}
