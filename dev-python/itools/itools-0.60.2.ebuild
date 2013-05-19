# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"
NEED_PYTHON=2.6

inherit distutils versionator

MY_PV=$(get_version_component_range 1-2)

DESCRIPTION="Python toolbox : virtual file system, index and search engine, web programming interface, etc"
HOMEPAGE="http://hforge.org/itools"
SRC_URI="http://download.hforge.org/${PN}/${MY_PV}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="office pdf"

RDEPEND="dev-libs/glib:2
         >=dev-python/pygobject-2.16.1
		 >=dev-libs/xapian-bindings-1.0.8
		 dev-python/matplotlib
         dev-python/imaging
		 pdf? ( >=dev-python/reportlab-2.2 )
		 office? ( >=dev-python/xlrd-0.6.1
		           >=app-text/poppler-0.10.4
				   >=app-text/wv2-0.2.3 )"

DEPEND="${RDEPEND}
        dev-util/pkgconfig"


DOCS="README.txt RELEASE-0.60.2 UPGRADE-0.60.0"

src_test(){
	cd "${S}"/test
	${python} test.py || die "Unittest have fail"
}
