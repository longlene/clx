# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit autotools

DESCRIPTION="metrics library for C++11"
HOMEPAGE="http://code.mrtazz.com/snyder/"
SRC_URI="https://github.com/mrtazz/snyder/archive/0.4.4.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}
