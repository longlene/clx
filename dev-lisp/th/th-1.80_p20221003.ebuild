# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="89c07128c5c0ce7b76ec63fdbaff27f609ed5fb3"
LIBTH_EGIT_COMMIT="030d9e9fd535880ad29357c610d68f4474711164"

LIBTH=libth-${LIBTH_EGIT_COMMIT}

DESCRIPTION="Common Lisp tensor and deep learning library"
HOMEPAGE="https://bitbucket.org/chunsj/th/"
SRC_URI="
	https://bitbucket.org/chunsj/th/get/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	https://bitbucket.org/chunsj/libth/get/${LIBTH_EGIT_COMMIT}.tar.gz -> ${LIBTH}.tar.gz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/mu
	sci-libs/openblas
"
BDEPEND=""

src_prepare() {
	default
	sed -e 's#libTHTensor.0.so#libTHTensor.so#' \
		-i "${WORKDIR}"/${LIBTH}/TH/GNUmakefile
	sed -e 's#libTHNeural.0.so#libTHNeural.so#' \
		-e 's#/usr/local/lib#../TH#' \
		-i "${WORKDIR}"/${LIBTH}/THNN/GNUmakefile
	sed -e "s#/usr/local/lib#/usr/$(get_libdir)#" \
		-i ffi/libs.lisp
}

src_compile() {
	emake -C "${WORKDIR}"/${LIBTH}/TH
	emake -C "${WORKDIR}"/${LIBTH}/THNN
}

src_install() {
	dolib.so "${WORKDIR}"/${LIBTH}/TH/libTHTensor.so
	dolib.so "${WORKDIR}"/${LIBTH}/THNN/libTHNeural.so
	common-lisp-3_src_install
}
