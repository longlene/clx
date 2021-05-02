# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit lua

DESCRIPTION="extend luajit ffi module to give more affinity to C codes"
HOMEPAGE="https://github.com/umegaya/ffiex"
SRC_URI="https://github.com/umegaya/ffiex/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_module -r ffiex
}
