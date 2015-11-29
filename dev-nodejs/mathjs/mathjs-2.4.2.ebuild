# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="Math.js is an extensive math library for JavaScript and Node.js"
HOMEPAGE="http://mathjs.org"
#SRC_URI=""

LICENSE="Apache-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-nodejs/typed-function
	dev-nodejs/tiny-emitter
	dev-nodejs/fraction_js
	dev-nodejs/decimal_js 
"
