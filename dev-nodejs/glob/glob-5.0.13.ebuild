# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="a little globber"
HOMEPAGE="https://github.com/isaacs/node-glob"
#SRC_URI=""

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/path-is-absolute
dev-nodejs/once
dev-nodejs/minimatch
dev-nodejs/inherits
dev-nodejs/inflight
"
