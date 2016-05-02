# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools git-2

DESCRIPTION="a POSIX threads workqueue library"
HOMEPAGE="https://github.com/mheily/libpwq"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mheily/libpwq.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
