# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="Adds an admin section to the hexo server"
HOMEPAGE="https://github.com/jaredly/hexo-admin"
#SRC_URI=""

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/serve-static
dev-nodejs/moment
dev-nodejs/hexo-util
dev-nodejs/hexo-front-matter
dev-nodejs/hexo-fs
dev-nodejs/extend
dev-nodejs/express-session
dev-nodejs/cookie-parser
dev-nodejs/connect-auth
dev-nodejs/body-parser
dev-nodejs/MD5
"
