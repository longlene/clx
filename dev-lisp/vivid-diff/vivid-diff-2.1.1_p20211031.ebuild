# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="413559446de5fcca9987a06ffb35a9aa6569d7be"

DESCRIPTION="Colored object diff viewer for common lisp"
HOMEPAGE="https://github.com/hyotang666/vivid-diff/"
SRC_URI="https://github.com/hyotang666/vivid-diff/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/vivid-colors
	dev-lisp/cl-colors2
	dev-lisp/closer-mop
	dev-lisp/matrix-case
"
BDEPEND=""
