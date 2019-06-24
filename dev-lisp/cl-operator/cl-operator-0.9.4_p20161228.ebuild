# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1a8e57795a0e17b61c3c767bb473582d401f79c7"

DESCRIPTION="Common Lisp library support C++ like operator overloading"
HOMEPAGE="https://github.com/show-matz/CL-OPERATOR"
SRC_URI="https://github.com/show-matz/CL-OPERATOR/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-overload
"
BDEPEND=""
