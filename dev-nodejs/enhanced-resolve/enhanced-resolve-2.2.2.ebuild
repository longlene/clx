# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit npm

DESCRIPTION="Offers a async require.resolve function"
HOMEPAGE="https://github.com/webpack/enhanced-resolve"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-nodejs/object-assign
	dev-nodejs/graceful-fs
	dev-nodejs/memory-fs
	dev-nodejs/tapable
"
