# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="browserify version of publicEncrypt & privateDecrypt"
HOMEPAGE="https://github.com/crypto-browserify/publicEncrypt"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/parse-asn1
dev-nodejs/create-hash
dev-nodejs/randombytes
dev-nodejs/browserify-rsa
dev-nodejs/bn_js
"
