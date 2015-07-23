# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="Terminal string styling done right"
HOMEPAGE="https://github.com/chalk/chalk"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/supports-color
dev-nodejs/strip-ansi
dev-nodejs/has-ansi
dev-nodejs/escape-string-regexp
dev-nodejs/ansi-styles
"
