# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6e471c89ff40b1de5029f925215eeca8bab0f798"

DESCRIPTION="CL nanomsg bindings"
HOMEPAGE="https://github.com/orthecreedence/cl-nanomsg"
SRC_URI="https://github.com/orthecreedence/cl-nanomsg/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
"
