# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="A minimal node SOAP client"
HOMEPAGE="https://www.npmjs.com/package/soap"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/debug
dev-nodejs/strip-bom
dev-nodejs/sax
dev-nodejs/request
dev-nodejs/lodash
"
