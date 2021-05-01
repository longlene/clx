# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f9751d5e8ea18a022ae503a1ed07995b31876a3c"

DESCRIPTION="A graphical File Manager in Common Lisp, using cl-cffi-gtk"
HOMEPAGE="https://github.com/stacksmith/cl-fm"
SRC_URI="https://github.com/stacksmith/cl-fm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-cffi-gtk
	dev-lisp/gtk-emacs-like-input
	dev-lisp/cl-ppcre
	dev-lisp/external-program
"
