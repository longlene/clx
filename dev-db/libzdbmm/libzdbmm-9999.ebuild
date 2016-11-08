# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools git-r3

DESCRIPTION="C++ binding for libzdb"
HOMEPAGE="https://github.com/mverbert/libzdbmm"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mverbert/libzdbmm.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-libs/libzdb"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}
