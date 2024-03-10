# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="f40d763205632c007ece8636b7856b2bbdbfe51c"

DESCRIPTION="Asynchronous C++ like Javascript"
HOMEPAGE="https://github.com/NodeppOficial/nodepp"
SRC_URI="https://github.com/NodeppOficial/nodepp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/openssl
	sys-libs/zlib
"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins -r include/nodepp
	einstalldocs
}
