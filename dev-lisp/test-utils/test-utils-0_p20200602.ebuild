# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8d0cead809ea789af2ee37ecb6b9e77c96fc6e76"

DESCRIPTION="Convenience functions and macros for testing Common Lisp applications via Prove and Quickcheck"
HOMEPAGE="https://github.com/inaimathi/test-utils"
SRC_URI="https://github.com/inaimathi/test-utils/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/prove
	dev-lisp/cl-quickcheck
	dev-lisp/agnostic-lizard
"
BDEPEND=""
