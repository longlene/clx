# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b7e47e9611f3fa96d1fcfcaf662cfa5becfbe0b7"

DESCRIPTION="Common Lisp wrapper to libgbm"
HOMEPAGE="https://github.com/malcolmstill/cl-gbm"
SRC_URI="https://github.com/malcolmstill/cl-gbm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	media-libs/mesa
"
