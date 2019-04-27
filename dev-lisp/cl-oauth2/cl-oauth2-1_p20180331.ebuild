# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="40abf85ede70a44a5f22b17f4e5ff59d750b4635"

DESCRIPTION="Common Lisp OAuth 2.0 implementation"
HOMEPAGE="https://github.com/MadEarl/cl-oauth2"
SRC_URI="https://github.com/MadEarl/cl-oauth2/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/ironclad
	dev-lisp/cl-base64
	dev-lisp/babel
	dev-lisp/closer-mop
	dev-lisp/cl-store
	dev-lisp/alexandria
	dev-lisp/f-underscore
	dev-lisp/split-sequence
	dev-lisp/trivial-garbage
	dev-lisp/darkma
	dev-lisp/cl-json
	dev-lisp/puri
	dev-lisp/hunchentoot
"
BDEPEND=""
