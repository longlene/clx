# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit eutils distutils python

DESCRIPTION="fb2 e-book format uitilities set"
HOMEPAGE="http://fb2utils.googlecode.com/"
SRC_URI="http://fb2utils.googlecode.com/files/fb2utils-0.6.0.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-python/lxml
		dev-db/sqlite"
RDEPEND="${DEPEND}"

src_prepare() {
		epatch "${FILESDIR}/setup_base.patch" || die "failed while patching setup.py"
}
