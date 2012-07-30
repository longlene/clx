# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit python multilib

DESCRIPTION="Static site builder using docutils"
HOMEPAGE="http://www.voidspace.org.uk/python/rest2web/"
SRC_URI="mirror://sourceforge/rest2web/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-python/docutils-0.3"


src_compile () {
	python r2w.py -n
}

src_install () {
	python_version
	local pkgpath="/usr/$(get_libdir)/python${PYVER}/site-packages"
	dodir "${pkgpath}"
	cp -a rest2web "${D}/${pkgpath}"
	dobin r2w.py
	dosym /usr/bin/r2w.py /usr/bin/r2w
	cp r2w.man r2w.1
	doman r2w.1
	dohtml -r docs_html/*
}

pkg_postinst () {
	python_version
	python_mod_optimize \
		"${ROOT}/usr/$(get_libdir)/python${PYVER}/site-packages/rest2web"
}

pkg_postrm () {
	python_version
	python_mod_cleanup \
		"${ROOT}/usr/$(get_libdir)/python${PYVER}/site-packages/rest2web"
}

