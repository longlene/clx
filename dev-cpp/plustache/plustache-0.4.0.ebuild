# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit autotools

DESCRIPTION="mustaches for C++"
HOMEPAGE="http://mustache.github.com"
SRC_URI="https://github.com/mrtazz/plustache/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-libs/boost"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}
