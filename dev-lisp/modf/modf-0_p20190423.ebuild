# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="30cd537cf560fa89076c4f1e3746702da2d179f5"

DESCRIPTION="A setf like macro for functional programming"
HOMEPAGE="https://github.com/smithzvk/modf"
SRC_URI="https://github.com/smithzvk/modf/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/iterate
"
BDEPEND=""
