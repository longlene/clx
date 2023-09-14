# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="d7813aa1aeb5936b9bee9ec5a7653f59f63e9672"

DESCRIPTION="C++11 header-only Minimal Acyclic Subsequential Transducers"
HOMEPAGE="https://github.com/yhirose/cpp-fstlib"
SRC_URI="https://github.com/yhirose/cpp-fstlib/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins fstlib.h
	dodoc README.md
}
