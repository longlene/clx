# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

EGIT_COMMIT="7fcbb5bbb0efb61527df54d4700cf32ea3fbb5cc"

DESCRIPTION="An up-to-date Common Lisp bindings library to the most recent GLFW OpenGL context management library"
HOMEPAGE="https://github.com/Shirakumo/glfw"
SRC_URI="https://github.com/Shirakumo/glfw/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/float-features
	dev-lisp/cl-opengl
	dev-lisp/cffi
"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

PATCHES=(
	"${FILESDIR}"/fix-path.patch
)
