# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1b4a0994c41a133d47c1e9590d0f137cc2d59bf1"

DESCRIPTION="Easy particle systems with fine grained control"
HOMEPAGE="http://shinmera.github.io/flare"
SRC_URI="https://github.com/Shinmera/flare/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lambda-fiddle
	dev-lisp/array-utils
	dev-lisp/trivial-garbage
	dev-lisp/3d-vectors
	dev-lisp/documentation-utils
	dev-lisp/for
"
