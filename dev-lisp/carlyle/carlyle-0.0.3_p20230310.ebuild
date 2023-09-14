# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="178389164ddc3cd0d48077d8181b0d3d6e96d797"

DESCRIPTION="A JSON based REST framework built on Ningle"
HOMEPAGE="https://github.com/K1D77A/carlyle"
SRC_URI="https://github.com/K1D77A/carlyle/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-str
	dev-lisp/clack
	dev-lisp/alexandria
	dev-lisp/ningle
	dev-lisp/cl-json
	dev-lisp/jonathan
	dev-lisp/shasht
	dev-lisp/closer-mop
	dev-lisp/hu_dwim_defclass-star
	dev-lisp/ironclad
	dev-lisp/local-time
"
BDEPEND=""
