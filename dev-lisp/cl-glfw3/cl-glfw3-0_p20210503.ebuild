# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="32c3f34d592d55ee7ce932ed85804c1a9c4158c6"

DESCRIPTION="Common Lisp bindings to GLFW"
HOMEPAGE="https://github.com/AlexCharlton/cl-glfw3"
SRC_URI="https://github.com/AlexCharlton/cl-glfw3/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	media-libs/glfw
	example? ( dev-lisp/cl-opengl dev-lisp/trivial-main-thread )
"

src_prepare() {
	default
	use example || rm -rf ${PN}-examples.asd examples
}
