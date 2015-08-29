# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="option parsing and help generation"
HOMEPAGE="https://github.com/gkz/optionator"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/type-check
dev-nodejs/fast-levenshtein
dev-nodejs/levn
dev-nodejs/wordwrap
dev-nodejs/deep-is
dev-nodejs/prelude-ls
"
