# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0098384f4a7440ce66130e5e491e033bf74dee1b"

DESCRIPTION=""
HOMEPAGE="https://github.com/K1D77A/lisp-pay"
SRC_URI="https://github.com/K1D77A/lisp-pay/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/str
	dev-lisp/ironclad
	dev-lisp/babel
	dev-lisp/alexandria
	dev-lisp/jonathan
	dev-lisp/dexador
	dev-lisp/lack
	dev-lisp/ningle
	dev-lisp/cl-base64
	dev-lisp/cl-tls
	dev-lisp/hunchentoot
	dev-lisp/closer-mop
	dev-lisp/hu_dwim_defclass-star
	dev-lisp/shasht
"
BDEPEND=""
