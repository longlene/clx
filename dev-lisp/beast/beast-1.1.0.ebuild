# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Basic Entity/Aspect/System Toolkit"
HOMEPAGE="https://github.com/sjl/beast/"
SRC_URI="https://github.com/sjl/beast/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lam
"

src_compile() {
	:
}
