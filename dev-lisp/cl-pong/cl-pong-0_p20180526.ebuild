# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

EGIT_COMMIT="70dff3e6e9d6064739af69ed34ec797be50147af"

DESCRIPTION="Pong implemented in Common Lisp using trivial-gamekit"
HOMEPAGE="https://github.com/mark-gerarts/cl-pong"
SRC_URI="https://github.com/mark-gerarts/cl-pong/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-gamekit
	dev-lisp/cl-bodge
"
