# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="The JavaScript Robotics and Hardware Programming Framework"
HOMEPAGE="https://github.com/rwaldron/johnny-five"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/serialport
dev-nodejs/firmata
dev-nodejs/array-includes
dev-nodejs/temporal
dev-nodejs/nanotimer
dev-nodejs/lodash
dev-nodejs/es6-shim
dev-nodejs/ease-component
dev-nodejs/descriptor
dev-nodejs/chalk
dev-nodejs/color-convert
"
