# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3

DESCRIPTION="nEXT Browser"
HOMEPAGE="https://next-browser.github.io"
SRC_URI="https://github.com/next-browser/next/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-strings
	dev-lisp/cl-string-match
	dev-lisp/prui
	dev-lisp/simple-queue
	dev-lisp/cl-sqlite
	dev-lisp/parenscript
	dev-lisp/cl-json
	app-emacs/slime
	dev-lisp/cl-cffi-gtk
	dev-lisp/cl-webkit
	dev-lisp/lparallel
"
