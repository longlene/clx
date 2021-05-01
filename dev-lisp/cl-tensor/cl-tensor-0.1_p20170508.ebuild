# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9446f5d4d47cdb5887e95d13559faa0dc3648970"

DESCRIPTION="a common lisp library for linear algebra"
HOMEPAGE="https://github.com/takahish/cl-tensor"
SRC_URI="https://github.com/takahish/cl-tensor/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
"
