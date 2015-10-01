# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="Glob matching for javascript/node.js"
HOMEPAGE="https://github.com/jonschlinkert/micromatch"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/regex-cache
dev-nodejs/parse-glob
dev-nodejs/object_omit
dev-nodejs/kind-of
dev-nodejs/is-glob
dev-nodejs/filename-regex
dev-nodejs/extglob
dev-nodejs/expand-brackets
dev-nodejs/braces
dev-nodejs/array-unique
dev-nodejs/arr-diff
"
