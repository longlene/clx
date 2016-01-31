# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

MY_PN=${PN/_/.}

DESCRIPTION="Syntax highlighting with language autodetection"
HOMEPAGE="https://github.com/isagalaev/highlight.js"
SRC_URI="http://registry.npmjs.org/${MY_PN}/-/${MY_PN}-${PV}.tgz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
