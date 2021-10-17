# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="db6c0eb95c8093079797b07cb990c2e33741464a"

DESCRIPTION="Linux I/O statistics per process"
HOMEPAGE="https://github.com/markwkm/iopp"
SRC_URI="https://github.com/markwkm/iopp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin ${BUILD_DIR}/iopp
	doman iopp.8
	dodoc README
}
