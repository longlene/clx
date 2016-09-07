# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Hprose for C++"
HOMEPAGE="https://github.com/hprose/hprose-cpp"
SRC_URI=""

EGIT_REPO_URI="https://github.com/hprose/hprose-cpp.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr
	doins -r hprose
	dodoc README.md
}
