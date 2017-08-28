# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2c6c2b1f5504079239bd62112842c5bbbf10387e"

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
