# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A C++ wrapper for the lapack libraries"
HOMEPAGE="http://lapackpp.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug doc"

RDEPEND="virtual/lapack
	virtual/blas"
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen[latex] )"

src_prepare() {
	default
	sed -i 's/\bmake\b/$(MAKE)/' Makefile.in
}

src_configure() {
	econf \
		$(use_enable debug) \
		--enable-static
}

src_compile() {
	default_src_compile
	use doc && emake srcdoc
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc AUTHORS MAINTAINER NEWS README RELEASE.NOTES
	use doc && dodoc -r api-doc/html/
}
