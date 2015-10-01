# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="Collision-resistant ids optimized for horizontal scaling and performance"
HOMEPAGE="https://github.com/ericelliott/cuid"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/node-fingerprint
dev-nodejs/core-js
dev-nodejs/browser-fingerprint
"
