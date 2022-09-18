# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="09626b22e1d86f8d9e3fc19bb44848031cad6d4c"

DESCRIPTION="unsharable version of std::shared_ptr"
HOMEPAGE="https://github.com/xhawk18/noshared_ptr"
SRC_URI="https://github.com/xhawk18/noshared_ptr/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins noshared.hpp
	dodoc Readme*.md
}
