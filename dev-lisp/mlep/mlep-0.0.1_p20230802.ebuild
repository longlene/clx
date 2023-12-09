# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="de55491f35d849622ff6ef079e4e8e61ecc33548"

DESCRIPTION="cl-mlep is a Common Lisp Machine Learning library for Educational Purposes"
HOMEPAGE="https://github.com/fzalkow/cl-mlep"
SRC_URI="https://github.com/fzalkow/cl-mlep/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/lla
	dev-lisp/cl-num-utils
"
