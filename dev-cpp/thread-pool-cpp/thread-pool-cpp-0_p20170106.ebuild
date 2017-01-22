# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="dd570aa5156dd662bb8a981934f7cf287087d51c"

DESCRIPTION="High performance C++14 thread pool"
HOMEPAGE="https://github.com/inkooboo/thread-pool-cpp"
SRC_URI="https://github.com/inkooboo/thread-pool-cpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins -r include/thread_pool{,.hpp}
	dodoc README.md
}
