# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="This library provides the functionality of PBKDF2 with the ability to use any supported hashing algorithm returned from crypto.getHashes\(\)"
HOMEPAGE="https://github.com/crypto-browserify/pbkdf2"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/create-hmac
"
