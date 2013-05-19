# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Google Web Toolkit (precompiled)"
HOMEPAGE="http://code.google.com/webtoolkit/"
SRC_URI="http://google-web-toolkit.googlecode.com/files/gwt-linux-${PV}.tar.bz2"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86"

IUSE="doc examples"

COMMON_DEP="!dev-java/google-web-toolkit 
		   virtual/libstdc++
		   "

RDEPEND=">=virtual/jre-1.4
	${COMMON_DEP}"
DEPEND=""

src_install() {
	MY_W="${WORKDIR}/gwt-linux-${PV}"
	MY_D="opt/google-web-toolkit"
	mv -- "${MY_W}"/mozilla-*/COPYING "${MY_W}/mozilla-COPYING"
	for DOC in about.html about.txt COPYING COPYING.html index.html mozilla-COPYING release_notes.html; do
		dodoc "${MY_W}/${DOC}"
		rm -- "${MY_W}/${DOC}"
	done
	dodir "/${MY_D}"
	use doc      || rm -R -- "${MY_W}/doc"
	use examples || rm -R -- "${MY_W}/samples"
	cp -R -- "${MY_W}"/* "${D}/${MY_D}/"
}
