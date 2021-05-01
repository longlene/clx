# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="34596f57d7d15615d96524661d221871a6e9818f"

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
