# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5c1d1f904b2abb60f55d5a37540abd1814794761"

DESCRIPTION="A documentation server based on TexInfo"
HOMEPAGE="https://github.com/mmontone/webinfo"
SRC_URI="https://github.com/mmontone/webinfo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/anaphora
	dev-lisp/hunchentoot
	dev-lisp/cl-who
	dev-lisp/puri
	dev-lisp/drakma
	dev-lisp/cxml
	dev-lisp/xpath
	dev-lisp/trivia
	dev-lisp/group-by
	dev-lisp/access
	dev-lisp/cl-forms
	dev-lisp/metabang-bind
	dev-lisp/assoc-utils
	dev-lisp/quri
	dev-lisp/montezuma
	dev-lisp/cl-intbytes
	dev-lisp/string-case
	dev-lisp/cl-tokyo-cabinet
"
BDEPEND=""
