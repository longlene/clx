# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="implementation of crypto for the browser"
HOMEPAGE="https://github.com/crypto-browserify/crypto-browserify"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/randombytes
dev-nodejs/public-encrypt
dev-nodejs/pbkdf2
dev-nodejs/diffie-hellman
dev-nodejs/browserify-sign
dev-nodejs/inherits
dev-nodejs/create-hash
dev-nodejs/create-hmac
dev-nodejs/create-ecdh
dev-nodejs/browserify-aes
"
