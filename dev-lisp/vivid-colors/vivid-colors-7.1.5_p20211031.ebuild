# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5a592fb07e243ad426018b0f3f71be4bde73522f"

DESCRIPTION="colored object printer for common lisp"
HOMEPAGE="https://github.com/hyotang666/vivid-colors"
SRC_URI="https://github.com/hyotang666/vivid-colors/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lambda-fiddle
	dev-lisp/millet
	dev-lisp/closer-mop
	dev-lisp/cl-colors2
"
BDEPEND=""
