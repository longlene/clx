# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="3cb541e025e5a58174c4a0d87a3038a79ddb5772"

DESCRIPTION="Porting Windows Dynamic Link Libraries to Linux"
HOMEPAGE="https://github.com/taviso/loadlibrary"
SRC_URI="https://github.com/taviso/loadlibrary/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin mpclient
	dodoc README.md
}
