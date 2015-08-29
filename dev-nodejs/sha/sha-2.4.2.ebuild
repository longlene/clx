# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

MY_PN=${PN}.js
MY_P=${MY_PN}-${PV}

DESCRIPTION="streaming sha1 hash in pure javascript"
HOMEPAGE="https://github.com/crypto-browserify/sha.js"
SRC_URI="http://registry.npmjs.org/${MY_PN}/-/${MY_P}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
