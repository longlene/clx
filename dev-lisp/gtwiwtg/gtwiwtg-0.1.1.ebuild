# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Naive generators for Common Lisp"
HOMEPAGE="https://github.com/cbeo/gtwiwtg"
SRC_URI="https://github.com/cbeo/gtwiwtg/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/prove dev-lisp/osicat )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.{asd,lisp}
}
