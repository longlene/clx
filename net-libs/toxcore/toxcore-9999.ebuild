# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="The future of online communications"
HOMEPAGE="https://github.com/irungentoo/toxcore.git"
SRC_URI=""

EGIT_REPO_URI="https://github.com/irungentoo/toxcore.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/libsodium
"
RDEPEND="${DEPEND}"

src_configure() {
	./autogen.sh && econf
}
