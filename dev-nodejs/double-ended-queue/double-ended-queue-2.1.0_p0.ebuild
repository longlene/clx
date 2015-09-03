# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

MY_PV=${PV/_p/-}
MY_P=${PN}-${MY_PV}

DESCRIPTION="Extremely fast double-ended queue implementation"
HOMEPAGE="https://github.com/petkaantonov/deque"
SRC_URI="http://registry.npmjs.org/${PN}/-/${MY_P}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
