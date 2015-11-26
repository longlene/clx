# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="Input Buffer and Output Buffer, just like Java ByteBuffer"
HOMEPAGE="https://github.com/node-modules/byte"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-nodejs/utility
	dev-nodejs/long
	dev-nodejs/is-type-of
	dev-nodejs/debug
"
