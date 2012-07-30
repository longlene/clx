# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit eutils git

DESCRIPTION="A high level C++ client for Cassandra"
HOMEPAGE="http://github.com/posulliv/libcassandra"
SRC_URI=""
EGIT_REPO_URI="http://github.com/posulliv/libcassandra.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples"

DEPEND="dev-libs/thrift"
RDEPEND="${DEPEND}"

src_unpack() {
	git_src_unpack
}

src_prepare() {
	git_src_prepare
	cd "${S}" || die "cd failed"
	./config/autorun.sh || die "autorun failed"
}

src_configure() {
	econf CPPFLAGS="-Wno-variadic-macros -I/usr/include/thrift" || die "econd failed"
}

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	dodoc AUTHORS COPYING ChangeLog NEWS README || die "dodoc failed"
	if use examples; then
		docinto examples
		dodoc examples/
	fi
}
