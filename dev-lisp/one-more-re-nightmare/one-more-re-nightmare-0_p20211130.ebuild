# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3912ef7f36d917dc0266f591cb1153a2373b6d16"

DESCRIPTION="A fast regular expression compiler in Common Lisp"
HOMEPAGE="https://github.com/telekons/one-more-re-nightmare"
SRC_URI="https://github.com/telekons/one-more-re-nightmare/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivia
	dev-lisp/alexandria
	dev-lisp/babel
	dev-lisp/esrap
	dev-lisp/trivial-indent
	dev-lisp/dynamic-mixins
	dev-lisp/stealth-mixin
	dev-lisp/bordeaux-threads
"
BDEPEND=""
