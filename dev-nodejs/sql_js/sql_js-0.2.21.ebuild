# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

MY_PN=${PN/_/.}
MY_P=${MY_PN}-${PV}

DESCRIPTION="SQLite library with support for opening and writing databases"
HOMEPAGE="https://github.com/kripken/sql.js"
SRC_URI="http://registry.npmjs.org/${MY_PN}/-/${MY_P}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
