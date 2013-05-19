# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit distutils

DESCRIPTION="An efficient, immutable, persistent mapping object database."
HOMEPAGE="http://discoproject.org"
SRC_URI="http://github.com/tuulos/disco/tarball/${PV} -> ${P}.tgz"

LICENSE="nokia"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-lang/python-2.6"
RDEPEND="${DEPEND}
	>=dev-libs/cmph-0.3"

src_compile() {
	# Directory that it unpacks to includes repository key
	S="${WORKDIR}"/`ls "${WORKDIR}"`/contrib/discodb
	cd "${S}"
}
