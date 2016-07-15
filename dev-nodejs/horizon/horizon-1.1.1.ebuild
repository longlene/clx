# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit npm

DESCRIPTION="An open-source developer platform for building realtime, scalable web apps"
HOMEPAGE="https://github.com/rethinkdb/horizon"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-nodejs/toml
	dev-nodejs/open
	dev-nodejs/rethinkdb
	dev-nodejs/mime-types
	dev-nodejs/jsonwebtoken
	dev-nodejs/joi
	dev-nodejs/hasbin
	dev-nodejs/chalk
	dev-nodejs/argparse
"
