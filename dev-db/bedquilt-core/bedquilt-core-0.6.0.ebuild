# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="A JSON document store on PostgreSQL"
HOMEPAGE="http://bedquiltdb.github.io/"
SRC_URI="https://github.com/BedquiltDB/bedquilt-core/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '1{s/python/python2/}' bin/template.py
	sed -i '21{s#sql/$(EXTENSION)--$(EXTVERSION).sql##}' src/Makefile
}

src_compile() {
	emake build-package
}

src_install() {
	#emake DESTDIR="${D}" -j1 -C dist/packages/bedquilt--${PV} install
	emake DESTDIR="${D}" -j1 install
}
