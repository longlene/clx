# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4bc58caf69493705d9ea42a989c1a44ae589732c"

DESCRIPTION="Yet another routes handling utility on top of Hunchentoot"
HOMEPAGE="https://github.com/mmontone/easy-routes"
SRC_URI="https://github.com/mmontone/easy-routes/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/hunchentoot
	dev-lisp/cl-routes
"
