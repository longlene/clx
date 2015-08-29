# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="EC cryptography"
HOMEPAGE="https://github.com/indutny/elliptic"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/inherits
dev-nodejs/hash_js
dev-nodejs/brorand
dev-nodejs/bn_js
"
