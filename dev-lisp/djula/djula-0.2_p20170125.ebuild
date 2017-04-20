# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="594837c585ee47b722663888192f40aa0f7ec2d2"

DESCRIPTION="Common Lisp port of the Django templating language"
HOMEPAGE="http://mmontone.github.io/djula"
SRC_URI="https://github.com/mmontone/djula/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/access
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/babel
	dev-lisp/cl-ppcre
	dev-lisp/cl-fad
	dev-lisp/split-sequence
	dev-lisp/local-time
	dev-lisp/closer-mop
	dev-lisp/trivial-backtrace
	dev-lisp/cl-slice
	dev-lisp/cl-locale
	dev-lisp/gettext
	dev-lisp/parser-combinators
	dev-lisp/iterate
"
