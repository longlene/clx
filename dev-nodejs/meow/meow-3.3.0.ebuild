# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="CLI app helper"
HOMEPAGE="https://github.com/sindresorhus/meow"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/object-assign
dev-nodejs/minimist
dev-nodejs/indent-string
dev-nodejs/camelcase-keys
"
