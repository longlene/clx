# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools git-r3

DESCRIPTION="Structured concurrency in C"
HOMEPAGE="http://libdill.org/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/sustrik/libdill.git"

#LICENSE="~amd64 ~arm ~x86"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
