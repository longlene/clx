# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9e10825c9a242e19b275fb35246573b33d7685c1"

DESCRIPTION="Thin wrapper over GLFW library"
HOMEPAGE="https://github.com/borodust/bodge-glfw"
SRC_URI="https://github.com/borodust/bodge-glfw/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/claw
	dev-lisp/claw-utils
	dev-lisp/trivial-features
	dev-lisp/glfw-blob
	dev-lisp/cffi-c-ref
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem :bodge-glfw\/example/,$d' ${PN}.asd
}
