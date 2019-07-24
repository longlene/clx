# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Cross-Platform Color Picker Written in Common Lisp"
HOMEPAGE="https://github.com/VitoVan/cl-pkr"
SRC_URI="https://github.com/VitoVan/cl-pkr/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/ltk
	dev-lisp/unix-opts
	dev-lisp/clx
"
BDEPEND=""
