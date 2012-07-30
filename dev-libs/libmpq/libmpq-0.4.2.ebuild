# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit libtool

DESCRIPTION="Library for manipulating mpq archives"
HOMEPAGE="https://libmpq.org/wiki/LibMpq"
SRC_URI="https://libmpq.org/downloader/download/file/2/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# TODO: make python optional

DEPEND=">=sys-libs/zlib-1.1.3
	>=app-arch/bzip2-1.0.4"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}

	elibtoolize

	# disable pyc compiling
	mv "${S}"/py-compile "${S}"/py-compile.orig
	ln -s $(type -P true) "${S}"/py-compile
}

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"

	doman doc/man*/*.[13] || die "doman failed"
	dodoc AUTHORS ChangeLog COPYING FAQ NEWS README THANKS TODO || die "dodoc failed"
}
