# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6526cc5513caf1591b3f0ab87ebb424275e0b3b0"

DESCRIPTION="Live web documentation browser for Common Lisp"
HOMEPAGE="https://github.com/mmontone/cl-livedocs"
SRC_URI="https://github.com/mmontone/cl-livedocs/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/assoc-utils
	dev-lisp/webinfo
"
BDEPEND=""
