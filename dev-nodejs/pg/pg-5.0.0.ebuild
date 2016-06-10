# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit npm

DESCRIPTION="PostgreSQL client"
HOMEPAGE="https://github.com/brianc/node-postgres"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-nodejs/semver
	dev-nodejs/pgpass
	dev-nodejs/pg-types
	dev-nodejs/pg-connection-string
	dev-nodejs/packet-reader
	dev-nodejs/generic-pool
	dev-nodejs/buffer-writer
"
