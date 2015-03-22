# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="Check if a string has ANSI escape codes"
HOMEPAGE="https://github.com/sindresorhus/has-ansi"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/ansi-regex
dev-nodejs/get-stdin
"
