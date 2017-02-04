# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="cee17481e8af30efd9766bae3267435d4507cbf1"

DESCRIPTION="Thin wrapper over Open Dynamics Engine for Common Lisp"
HOMEPAGE="https://github.com/borodust/bodge-ode"
SRC_URI="https://github.com/borodust/bodge-ode/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/cl-autowrap
	dev-games/ode
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all spec
}
