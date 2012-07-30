# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

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
	#Parallel build issues
	sed -i 's/\bmake\b/$(MAKE)/' Makefile.in
}

src_configure() {
	econf \
		$(use_enable debug) \
		--enable-static
}

src_compile() {
	default_src_compile
	use doc && emake srcdoc || die "Documentation creation failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc AUTHORS MAINTAINER NEWS README RELEASE.NOTES  || die
	use doc && dohtml -r api-doc/html/ || die
}
