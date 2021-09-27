# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="103ff39c566a63ce07e986e670aeb1d5a5033737"

DESCRIPTION="vellum plot"
HOMEPAGE="https://github.com/sirherrbatka/vellum-plot"
SRC_URI="https://github.com/sirherrbatka/vellum-plot/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/serapeum
	dev-lisp/vellum
	dev-lisp/alexandria
	dev-lisp/documentation-utils-extensions
"
BDEPEND=""
