# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5de7e2d695826b25d58af42ab203eb5aa194ff5d"

DESCRIPTION="lisp bindings to ptrace"
HOMEPAGE="https://github.com/k-stz/cl-ptrace"
SRC_URI="https://github.com/k-stz/cl-ptrace/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
"
