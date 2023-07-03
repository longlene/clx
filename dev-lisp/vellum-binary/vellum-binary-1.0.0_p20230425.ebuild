# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="032bf6dac4b847d0481aab73c355b198130314a0"

DESCRIPTION="vellum custom binary format"
HOMEPAGE="https://github.com/sirherrbatka/vellum-binary/"
SRC_URI="https://github.com/sirherrbatka/vellum-binary/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-lisp/vellum-1.3.0
	dev-lisp/chipz
	dev-lisp/salza2
	dev-lisp/nibbles
	dev-lisp/ieee-floats
	dev-lisp/cl-conspack
"
BDEPEND=""
