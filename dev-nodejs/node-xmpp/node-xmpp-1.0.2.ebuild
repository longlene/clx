# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="Idiomatic XMPP client, component & server library for node.js"
HOMEPAGE="https://github.com/node-xmpp/node-xmpp"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-nodejs/node-xmpp-core
	dev-nodejs/node-xmpp-server
	dev-nodejs/node-xmpp-client
	dev-nodejs/node-xmpp-component
	dev-nodejs/brfs
	dev-nodejs/browserify
	dev-nodejs/faye-websocket
	dev-nodejs/browser-request
	dev-nodejs/request
	dev-nodejs/ltx
	dev-nodejs/node-expat
"
