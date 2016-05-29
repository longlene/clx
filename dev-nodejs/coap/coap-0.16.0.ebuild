# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="A CoAP library for node modelled after 'http'"
#HOMEPAGE=""
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-nodejs/readable-stream
	dev-nodejs/lru-cache
	dev-nodejs/fastseries
	dev-nodejs/debug
	dev-nodejs/coap-packet
	dev-nodejs/capitalize
	dev-nodejs/bl
"
