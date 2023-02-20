# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="403c5a0a293f52d8d66d2c26b3ed6064cbcb1091"

DESCRIPTION="AWS SDK for Common Lisp"
HOMEPAGE="https://github.com/pokepay/aws-sdk-lisp"
SRC_URI="https://github.com/pokepay/aws-sdk-lisp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
