# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit autotools

DESCRIPTION="Simple Chinese Word Segmentation"
HOMEPAGE="http://www.xunsearch.com/scws/"
SRC_URI="https://github.com/hightman/scws/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}

src_configure() {
	econf --sysconfdir=/etc/scws
}
