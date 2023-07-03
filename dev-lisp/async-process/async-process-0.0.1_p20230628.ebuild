# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot autotools

EGIT_COMMIT="859db12e7f8bf3546487ea4fd7681d07c767306a"

DESCRIPTION="async process"
HOMEPAGE="https://github.com/lem-project/async-process"
SRC_URI="https://github.com/lem-project/async-process/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
"

src_prepare() {
	default
	eautoreconf
}

src_compile() {
	emake
}

src_install() {
	dolib.so .libs/libasyncprocess.so
	common-lisp-3_src_install
}
