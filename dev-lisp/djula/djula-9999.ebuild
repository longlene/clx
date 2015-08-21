# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Common Lisp port of the Django templating language"
HOMEPAGE="http://mmontone.github.io/djula"
#SRC_URI=""

EGIT_REOPO_URI="https://github.com/mmontone/djula.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
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
