# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="86a4e4299e59c881524fb56bd3476ba8f3591a76"

DESCRIPTION="A macro-based swagger binding generator for Common Lisp"
HOMEPAGE="https://github.com/Tevo45/juniper"
SRC_URI="https://github.com/Tevo45/juniper/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-json
	dev-lisp/drakma
	dev-lisp/kebab
	dev-lisp/puri
"
BDEPEND=""
