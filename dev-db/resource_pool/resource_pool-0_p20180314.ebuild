# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="54a095ec1d2627523a9494b0a33878f2dcc5dd22"

DESCRIPTION="C++ header only library purposed to create pool of some resources like keepalive connections"
HOMEPAGE="https://github.com/elsid/resource_pool"
SRC_URI="https://github.com/elsid/resource_pool/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/boost
"
