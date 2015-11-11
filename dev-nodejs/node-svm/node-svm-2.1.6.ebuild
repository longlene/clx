# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="Support Vector Machine for nodejs"
HOMEPAGE="https://github.com/nicolaspanel/node-svm"
#SRC_URI=""

LICENSE="MIt"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-nodejs/underscore
	dev-nodejs/stringify-object
	dev-nodejs/q
	dev-nodejs/promptly
	dev-nodejs/osenv
	dev-nodejs/optimist
	dev-nodejs/numeric
	dev-nodejs/nopt
	dev-nodejs/node-gyp
	dev-nodejs/nan
	dev-nodejs/mout
	dev-nodejs/moment
	dev-nodejs/inquirer
	dev-nodejs/handlebars
	dev-nodejs/graceful-fs
	dev-nodejs/chalk
	dev-nodejs/cardinal
	dev-nodejs/abbrev
"
