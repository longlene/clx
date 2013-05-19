# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

DESCRIPTION="Google Web Toolkit (precompiled)"
HOMEPAGE="http://code.google.com/webtoolkit/"
SRC_URI="http://google-web-toolkit.googlecode.com/files/gwt-${PV}.zip"

LICENSE="Apache-2.0"
SLOT="${PV}"
KEYWORDS="~amd64 ~x86"

IUSE="+ant doc examples"

RDEPEND=">=virtual/jre-1.5
	ant? ( dev-java/ant )"

DEPEND="app-arch/unzip"

S="${WORKDIR}/gwt-${PV}"

src_install() {
	cd "${S}"

	# Windows stuff
	rm -- *.cmd *.dll

	for DOC in COPYING *.html *.txt; do
		dodoc "${DOC}"
		rm -- "${DOC}"
	done

	use doc      || rm -R doc
	use examples || rm -R samples

	insinto "/opt/${P}"
	doins -r *
}
