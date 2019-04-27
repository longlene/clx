# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ec54cbe16ade1e6ed1bbbfcf093cd311af19f545"

DESCRIPTION="Execute Javascript from Common Lisp"
HOMEPAGE="https://github.com/LowH/exec-js"
SRC_URI="https://github.com/LowH/exec-js/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-json
	dev-lisp/external-program
"
BDEPEND=""
