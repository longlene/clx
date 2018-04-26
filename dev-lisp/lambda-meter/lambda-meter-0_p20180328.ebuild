# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d95636d037ee667270bb54b396856fa9565b9976"

DESCRIPTION="lambda profiler for sbcl"
HOMEPAGE="https://github.com/hyotang666/lambda-meter"
SRC_URI="https://github.com/hyotang666/lambda-meter/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/with-package
	dev-lisp/named-readtables
"
