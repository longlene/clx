# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="run as random user"
HOMEPAGE="https://github.com/teran-mckinney/raru"
SRC_URI=""

EGIT_REPO_URI="https://github.com/teran-mckinney/raru.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin raru
	dodoc README.md
}
