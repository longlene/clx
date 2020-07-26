# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit flag-o-matic git-r3

DESCRIPTION="swconfig from OpenWrt"
HOMEPAGE="https://github.com/jekader/swconfig"
SRC_URI=""

EGIT_REPO_URI="https://github.com/jekader/swconfig.git"

LICENSE="GPL-2"
SLOT="0"
#KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="dev-libs/libnl:3"
RDEPEND="${DEPEND}"

src_prepare() {
	append-flags $($(tc-getPKG_CONFIG) --cflags libnl-3.0)
}
