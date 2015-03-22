# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

MY_PN=${PN/_/.}

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="http://registry.npmjs.org/${MY_PN}/-/${MY_PN}-${PV}.tgz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
