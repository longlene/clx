# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit npm

DESCRIPTION="A JavaScript code analyzer for deep, cross-editor language support"
HOMEPAGE="https://github.com/ternjs/tern"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-nodejs/typescript
	dev-nodejs/minimatch
	dev-nodejs/glob
	dev-nodejs/enhanced-resolve
	dev-nodejs/acorn
"
