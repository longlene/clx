# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit lua

DESCRIPTION="simple colour text printing for the ANSI compatible terminals"
HOMEPAGE="https://github.com/ldrumm/lua-chroma"
SRC_URI="https://github.com/ldrumm/lua-chroma/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
