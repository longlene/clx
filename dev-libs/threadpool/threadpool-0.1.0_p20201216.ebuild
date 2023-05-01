# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="9f7df71c1274fbb6af5a25a1d190044d9c1eda08"

DESCRIPTION="A simple C Thread pool implementation"
HOMEPAGE="https://github.com/mbrossard/threadpool"
SRC_URI="https://github.com/mbrossard/threadpool/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dolib.so libthreadpool.so
	insinto /usr/include
	doins src/threadpool.h
	dodoc README.md
}
