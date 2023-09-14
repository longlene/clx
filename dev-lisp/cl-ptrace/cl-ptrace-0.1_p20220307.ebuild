# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="10b95e226d21e0059e0ce0ff6130895522ec64b4"

DESCRIPTION="lisp bindings to ptrace"
HOMEPAGE="https://github.com/k-stz/cl-ptrace"
SRC_URI="https://github.com/k-stz/cl-ptrace/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/osicat
"
