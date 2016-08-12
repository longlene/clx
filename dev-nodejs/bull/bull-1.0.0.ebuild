# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit npm

DESCRIPTION="Job manager"
HOMEPAGE="https://github.com/OptimalBits/bull"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-nodejs/semver
	dev-nodejs/redis
	dev-nodejs/node-uuid
	dev-nodejs/lodash
	dev-nodejs/debuglog
	dev-nodejs/bluebird
"
