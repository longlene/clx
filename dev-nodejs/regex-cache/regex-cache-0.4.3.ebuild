# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit npm

DESCRIPTION="Memoize the results of a call to the RegExp constructor"
HOMEPAGE="https://github.com/jonschlinkert/regex-cache"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-nodejs/is-primitive
	dev-nodejs/is-equal-shallow
"
