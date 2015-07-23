# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

MY_PV=${PV/_/-}

DESCRIPTION="A module to create readable \"multipart/form-data\" streams"
HOMEPAGE="https://github.com/felixge/node-form-data"
SRC_URI="http://registry.npmjs.org/${PN}/-/${PN}-${MY_PV}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/mime-types
dev-nodejs/combined-stream
dev-nodejs/async
"
