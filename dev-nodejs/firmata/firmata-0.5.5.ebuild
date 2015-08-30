# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="A library to control an arduino running firmata"
HOMEPAGE="https://github.com/jgautier/firmata"
#SRC_URI=""

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/serialport
dev-nodejs/object-assign
dev-nodejs/es6-map
dev-nodejs/browser-serialport
"
