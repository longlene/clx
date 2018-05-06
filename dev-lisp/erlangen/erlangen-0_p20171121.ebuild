# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="204166b33833c49841617bbc6ecfaf4dd77cf6d8"

DESCRIPTION="Distributed, asychronous message passing system for Clozure Common Lisp"
HOMEPAGE="https://github.com/eugeneia/erlangen"
SRC_URI="https://github.com/eugeneia/erlangen/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivia
	dev-lisp/jpl-queues
	dev-lisp/trivial-utf8
	dev-lisp/fast-io
	dev-lisp/cl-conspack
	dev-lisp/split-sequence
"
