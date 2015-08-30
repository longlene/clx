# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

MY_PN=${PN/_/.}
MY_P=${MY_PN}-${PV}

DESCRIPTION="Parser for the client for the realtime Engine"
HOMEPAGE="https://github.com/LearnBoost/engine.io-parser"
SRC_URI="http://registry.npmjs.org/${MY_PN}/-/${MY_P}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/has-binary
dev-nodejs/utf8
dev-nodejs/blob
dev-nodejs/after
dev-nodejs/base64-arraybuffer
dev-nodejs/arraybuffer_slice
"
