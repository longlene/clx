# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  ranger Exp $

EAPI="4"

DESCRIPTION="highlight.js"
HOMEPAGE="https://github.com/isagalaev/highlight.js"
SRC_URI="https://github.com/isagalaev/highlight.js/tarball/${PV} -> ${P}.tar.gz"

IUSE=""
LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_unpack() {
	unpack "${A}"
}

src_compile() {
	python isagalaev-highlight.js-9143b18/tools/build.py
}

src_install() {
	mkdir -p ${D}/usr/share/${PN}
	cp -r ${WORKDIR}/isagalaev-highlight.js-9143b18/* ${D}/usr/share/${PN}/
}
