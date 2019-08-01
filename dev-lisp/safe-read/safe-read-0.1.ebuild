# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="A variant of READ secure"
HOMEPAGE="https://github.com/phoe/safe-read"
SRC_URI="https://github.com/phoe/safe-read/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/local-time
	dev-lisp/trivial-garbage
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem #:safe-read\/test/,$d' ${PN}.asd
		rm test.lisp
	fi
}
