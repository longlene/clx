# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="Node-core streams for userland"
HOMEPAGE="https://github.com/nodejs/readable-stream"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/util-deprecate
dev-nodejs/string_decoder
dev-nodejs/process-nextick-args
dev-nodejs/isarray
dev-nodejs/inherits
dev-nodejs/core-util-is
"
