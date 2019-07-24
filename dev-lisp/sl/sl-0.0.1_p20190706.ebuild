# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="be359b7b6eecf541487567d600e3242508c3a033"

DESCRIPTION="SL: Dependency language for Common Lisp"
HOMEPAGE="https://github.com/equwal/sl"
SRC_URI="https://github.com/equwal/sl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"
BDEPEND=""
