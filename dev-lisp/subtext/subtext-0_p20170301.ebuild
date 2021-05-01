# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f9886fcba2c641e5035312bf2585080bb50a7565"

DESCRIPTION="A mostly-text-based UI bridges Common Lisp objects and runs of text"
HOMEPAGE="https://github.com/stacksmith/subtext"
SRC_URI="https://github.com/stacksmith/subtext/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-cffi-gtk
	dev-lisp/bordeaux-threads
	dev-lisp/trivial-gray-streams
	dev-lisp/usocket
	dev-lisp/anaphora
	dev-lisp/alexandria
	dev-lisp/trivial-utf8
"
