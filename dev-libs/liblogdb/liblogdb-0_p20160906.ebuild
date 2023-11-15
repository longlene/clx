# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools vcs-snapshot

EGIT_COMMIT="2e463103934d114730e90ff488d35213920ac23c"

DESCRIPTION="A save and simple append only key-/value-database format"
HOMEPAGE="https://github.com/liblogdb/liblogdb"
SRC_URI="https://github.com/liblogdb/liblogdb/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
}
