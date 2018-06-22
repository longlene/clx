# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="eccc5e5ef7b2e82126ff5db826bce60b965413db"

DESCRIPTION="A neural network implementation in Common Lisp"
HOMEPAGE="https://github.com/nicolasavru/cl-nn"
SRC_URI="https://github.com/nicolasavru/cl-nn/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"
