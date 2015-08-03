# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="SSH2 and SFTP(v3) client/server protocol streams for node.js"
HOMEPAGE="https://github.com/mscdex/ssh2-streams"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/jsbn
dev-nodejs/asn1
dev-nodejs/streamsearch
dev-nodejs/readable-stream
"
