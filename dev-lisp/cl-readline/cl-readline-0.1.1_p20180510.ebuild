# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6f6d509d61c1d6a25734a28533afef27acbe7b72"

DESCRIPTION="Common Lisp bindings to GNU Readline library"
HOMEPAGE="https://mrkkrp.github.io/cl-readline/"
SRC_URI="https://github.com/mrkkrp/cl-readline/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sys-libs/readline
	dev-lisp/alexandria
	dev-lisp/cffi
"
