# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="72e3cd93cbeb447e5f25d623aac0b7482b8adf0e"

DESCRIPTION="C++11 header-only memory mapped file library"
HOMEPAGE="https://github.com/yhirose/cpp-mmaplib"
SRC_URI="https://github.com/yhirose/cpp-mmaplib/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins mmaplib.h
	dodoc README.md
}
