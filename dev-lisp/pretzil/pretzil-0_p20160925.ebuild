# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="17ab38ed04aa9ec16fc24adf6fa49c92c1586e20"

DESCRIPTION="Common Lisp Z-Machine interpreter"
HOMEPAGE="https://github.com/LispEngineer/Pretzil"
SRC_URI="https://github.com/LispEngineer/Pretzil/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/mcclim
"
BDEPEND=""
