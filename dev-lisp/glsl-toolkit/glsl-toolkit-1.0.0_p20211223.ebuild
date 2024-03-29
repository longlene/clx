# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="76540be6ad6f3e0f56bf3532e59a2f9dfd5c32e8"

DESCRIPTION="A parser for OpenGL Shader Language source files"
HOMEPAGE="https://shirakumo.github.io/glsl-toolkit/"
SRC_URI="https://github.com/Shirakumo/glsl-toolkit/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/parse-float
	dev-lisp/trivial-indent
	dev-lisp/cl-ppcre
"
