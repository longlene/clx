# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Linux-native io_uring I/O access library"
HOMEPAGE="https://git.kernel.dk/cgit/liburing/"
SRC_URI="https://git.kernel.dk/cgit/liburing/snapshot/${P}.tar.gz"

LICENSE="LGPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	./configure --libdir=/usr/$(get_libdir) --mandir=/usr/share/man
}
