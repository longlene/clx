# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4890f268cc5ce53660b7154067b4e35b6ec97921"

DESCRIPTION="Common Lisp bindings for bearlibterminal"
HOMEPAGE="https://github.com/sjl/cl-blt"
SRC_URI="https://github.com/sjl/cl-blt/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/bearlibterminal
	dev-lisp/cffi
	dev-lisp/trivial-main-thread
"
