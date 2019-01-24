# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="80f1badd1a024bda04a5a91342a98ce1a7760772"

DESCRIPTION="A Doom like game made in Common Lisp"
HOMEPAGE="https://github.com/Th30n/cl-shake"
SRC_URI="https://github.com/Th30n/cl-shake/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-sdl2
	dev-lisp/alexandria
	dev-lisp/iterate
	dev-lisp/metabang-bind
	dev-lisp/cl-opengl
	dev-lisp/cffi
	dev-lisp/cl-ppcre
	test? ( dev-lisp/prove )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		rm -r shake/{shake-test.asd,data-test.lisp,world-test.lisp}
		sed -i '/defsystem "shiva\/test/,$d' shiva/shiva.asd
		rm shiva/shiva-test.lisp
		sed -i '/defsystem "shake-bspc\/test/,$d' shake-bspc/shake-bspc.asd
		rm shake-bspc/{shake-bspc-test.lisp,brush-test.lisp}
	fi
	rm -r shake-ed edkit
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all shake/{shaders,share}
}
