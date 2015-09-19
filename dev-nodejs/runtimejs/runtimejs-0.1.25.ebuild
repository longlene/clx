# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="Core runtime.js library"
HOMEPAGE="https://github.com/runtimejs/runtime"
#SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/u8-view
dev-nodejs/typeutils
dev-nodejs/module-singleton
dev-nodejs/isint
dev-nodejs/event-controller
dev-nodejs/bit-twiddle
dev-nodejs/assert-error
"
