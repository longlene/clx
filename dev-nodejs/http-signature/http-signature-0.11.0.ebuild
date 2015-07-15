# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="Reference implementation of Joyent's HTTP Signature scheme"
HOMEPAGE="https://github.com/joyent/node-http-signature"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/asn1
dev-nodejs/ctype
dev-nodejs/assert-plus
"
