# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="Terminal string styling done right"
HOMEPAGE="https://github.com/sindresorhus/chalk"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/ansi-styles
dev-nodejs/escape-string-regexp
dev-nodejs/has-ansi
dev-nodejs/strip-ansi
dev-nodejs/supports-color
"
