# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e2a091ee9fa4d8d09affb6f25d2c333fb215e026"

DESCRIPTION="Common Lisp Voxel Game Engine"
HOMEPAGE="https://github.com/terminal625/sucle"
SRC_URI="https://github.com/terminal625/sucle/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/utility
	dev-lisp/cl-glfw3
	dev-lisp/cl-opengl
	dev-lisp/split-sequence
"
BDEPEND=""
