# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8294d61baadb06c39faaa3414b20dc9267f41468"

DESCRIPTION="Scalar Vector Machine implementation in pure Common Lisp"
HOMEPAGE="https://github.com/gonzojive/cl-svm"
SRC_URI="https://github.com/gonzojive/cl-svm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
