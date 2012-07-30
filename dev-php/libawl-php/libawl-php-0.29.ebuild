# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils php-lib-r1

DESCRIPTION="Andrew McMillan's web libraries: A collection of generic classes
and functions used by the davical calendar server"
HOMEPAGE="http://rscds.sourceforge.net/"
SRC_URI="mirror://sourceforge/rscds/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="doc? ( dev-php/PEAR-PhpDocumentor )"
RDEPEND="${DEPEND}"

need_php5

pkg_setup() {
	require_php_with_use pcre postgres xml
}

src_compile() {
	if use doc ; then
		ebegin "Generating documentation"
		phpdoc -c "docs/api/phpdoc.ini"
		eend $? || die "Documentation failed to build"
	fi
} 

src_install() {
	local docs="debian/README.debian debian/changelog"
	dodoc-php ${docs} || die "dodoc failed"
	
	if use doc ; then
		dohtml -r "docs/api/" || die "dohtml failed"
	fi
	
	insinto /usr/share/awl
	doins -r dba  || die "doins failed"

	php-lib-r1_src_install ./inc `find ./inc -type f -print | sed -e "s|./inc||g"`
}
