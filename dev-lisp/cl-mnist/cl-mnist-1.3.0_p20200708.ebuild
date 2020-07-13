# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="edf8f64b5f6ea835b0388f39cd8c86d8a323e31a"

DESCRIPTION="MNIST dataset preprocessor for Common Lisp"
HOMEPAGE="https://github.com/hyotang666/cl-mnist"
SRC_URI="https://github.com/hyotang666/cl-mnist/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/dexador
	dev-lisp/chipz
	dev-lisp/fast-io
	dev-lisp/nibbles
	dev-lisp/slurp
"
BDEPEND=""
