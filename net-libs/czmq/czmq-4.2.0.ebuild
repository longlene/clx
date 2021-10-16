# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake

DESCRIPTION="High-level C Binding for ZeroMQ"
HOMEPAGE="http://czmq.zeromq.org"
SRC_URI="https://github.com/zeromq/czmq/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 arm ~arm64 hppa ~x86"
IUSE="doc static-libs test"

RDEPEND="
	sys-apps/util-linux
	net-libs/zeromq
"
DEPEND="${RDEPEND}
	app-text/asciidoc
	app-text/xmlto
"

DOCS=( NEWS AUTHORS )

