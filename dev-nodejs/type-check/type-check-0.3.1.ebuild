# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="type-check allows you to check the types of JavaScript values at runtime with a Haskell like type syntax"
HOMEPAGE="https://github.com/gkz/type-check"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/prelude-ls
"
