# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="pure js diffie-hellman"
HOMEPAGE="https://github.com/crypto-browserify/diffie-hellman"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/randombytes
dev-nodejs/miller-rabin
dev-nodejs/bn_js
"
