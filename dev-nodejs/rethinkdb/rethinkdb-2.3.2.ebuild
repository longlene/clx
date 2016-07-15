# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit npm

DESCRIPTION="JavaScript driver library for the RethinkDB database "
HOMEPAGE="https://github.com/rethinkdb/rethinkdb"
#SRC_URI=""

LICENSE="as-is"
SLOT="0"
#KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-nodejs/bluebird
"
