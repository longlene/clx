# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2146b25ed87c9962d2de7a745bd8bb022ff9d7e1"

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
