# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0b48917e29a9b3102841e782a4ef2a8cb28d0f65"

DESCRIPTION="A collection of useful types, functions and macros for Common Lisp"
HOMEPAGE="https://gitlab.com/ediethelm/trivial-utilities"
SRC_URI="https://gitlab.com/ediethelm/trivial-utilities/repository/archive.tar.gz?ref=${EGIT_COMMIT} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/iterate
	dev-lisp/closer-mop
"
BDEPEND=""
