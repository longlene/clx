# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="Apple airplay and RAOP protocol server"
HOMEPAGE="https://github.com/juhovh/shairplay"
SRC_URI=""

EGIT_REPO_URI="https://github.com/juhovh/shairplay.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	./autogen.sh
	econf --prefix=/usr
}
