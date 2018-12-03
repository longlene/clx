# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="77533fe518408a9c2b87afeec940f61b1ed528a2"

DESCRIPTION="NNG (nanomsg next gen) bindings for common lisp"
HOMEPAGE="https://github.com/stacksmith/cl-nng"
SRC_URI="https://github.com/stacksmith/cl-nng/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
"
BDEPEND=""
