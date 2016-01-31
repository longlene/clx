# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3

DESCRIPTION="Common Lisp bindings to GNU Readline library"
HOMEPAGE="https://mrkkrp.github.io/cl-readline/"
SRC_URI="mirror://github/mrkkrp/cl-readline/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
sys-libs/readline
dev-lisp/alexandria
dev-lisp/cffi
"
