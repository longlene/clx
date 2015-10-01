# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="Fast & forgiving HTML/XML/RSS parser"
HOMEPAGE="https://github.com/fb55/htmlparser2"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/entities
dev-nodejs/readable-stream
dev-nodejs/domelementtype
dev-nodejs/domutils
dev-nodejs/domhandler
"
