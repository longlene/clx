# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit python eutils

SRC_URI="http://rimonbarr.com/repository/${PN}/code/${PN}"
DESCRIPTION="fast, efficient, command-line utility for downloading quotes from Yahoo."
HOMEPAGE="http://rimonbarr.com/repository/pyq/index.html"
LICENSE="GPL-2"

SLOT="0"
IUSE=""
KEYWORDS="~x86"

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	cp ${DISTDIR}/pyq ${WORKDIR}
}

src_install() {
	python_version
	cd ${WORKDIR}
	insinto /usr/$(get_libdir)/python${PYVER}/site-packages/
	newins pyq pyq.py
	make_wrapper pyq "python /usr/${get_libdir}/python${PYVER}/site-packages/pyq.py"
}
