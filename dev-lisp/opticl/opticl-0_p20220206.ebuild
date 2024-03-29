# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

if [[ ${PV} = *9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/slyrus/opticl.git"
else
	inherit vcs-snapshot
	EGIT_COMMIT="f6fc4dc5fa61ae3f2527b77e4bda99001ba37dcb"
	SRC_URI="https://github.com/slyrus/opticl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
fi


DESCRIPTION="An image processing library for Common Lisp"
HOMEPAGE="https://github.com/slyrus/opticl"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/retrospectiff
	dev-lisp/zpng
	dev-lisp/png-read
	dev-lisp/cl-jpeg
	dev-lisp/skippy
	dev-lisp/opticl-core
	dev-lisp/fiveam
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
