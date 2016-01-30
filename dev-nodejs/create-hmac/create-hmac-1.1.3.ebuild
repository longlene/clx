# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="node style hmacs in the browser"
HOMEPAGE="https://github.com/crypto-browserify/createHmac"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="
dev-nodejs/inherits
dev-nodejs/create-hash
"
RDEPEND="${DEPEND}"
