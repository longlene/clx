# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="A powerful templating engine with inheritance, asynchronous control, and more"
HOMEPAGE="https://github.com/mozilla/nunjucks"
#SRC_URI=""

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/optimist
dev-nodejs/chokidar
dev-nodejs/asap
"
