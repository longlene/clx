# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit cmake

DESCRIPTION="A simple and efficient MsgPack binary serialization in a self-contained header file"
HOMEPAGE="https://github.com/rtsisyk/msgpuck"
SRC_URI="https://github.com/rtsisyk/msgpuck/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
