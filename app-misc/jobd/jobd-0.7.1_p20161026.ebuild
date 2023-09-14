# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="547be324c5327417eae2a4b5acfd8f68cb4622f9"

DESCRIPTION="A job management framework"
HOMEPAGE="https://github.com/mheily/jobd"
SRC_URI="https://github.com/mheily/jobd/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/libkqueue
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e '/check_header/{s#sys/event.h#kqueue/sys/event.h#}' \
		-e "/make_define\ 'kqueue_CFLAGS'/{s#''#\"\$(pkg-config --cflags libkqueue)\"#}" \
		-e "/make_define\ 'kqueue_LDADD'/{s#''#\"\$(pkg-config --libs libkqueue)\"#}" \
		-i src/configure || die "prepare failed"
}

src_configure() {
	./configure || die "configure failed"
}
