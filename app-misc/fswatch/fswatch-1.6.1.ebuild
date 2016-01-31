# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="A cross-platform file change monitor"
HOMEPAGE="http://emcrisostomo.github.io/fswatch/"
SRC_URI="https://github.com/emcrisostomo/fswatch/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	./autogen.sh
	default
}
