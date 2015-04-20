# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3

DESCRIPTION="High performance serialization library for Common Lisp"
HOMEPAGE="https://github.com/cosmos72/hyperluminal-mem"
SRC_URI="https://github.com/cosmos72/hyperluminal-mem/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/osicat
dev-lisp/swap-bytes
dev-lisp/trivial-features
dev-lisp/stmx
"
