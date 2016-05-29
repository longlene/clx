# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="A persistent key-value database based on mmap"
HOMEPAGE="https://github.com/sck/localmemcache"
SRC_URI=""

EGIT_REPO_URI="https://github.com/sck/localmemcache.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	econf --prefix="${D}"/usr
}
