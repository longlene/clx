# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6dba6e44771488ed0206569dbd219a3c537396fa"

DESCRIPTION="A Common Lisp library for text user interfaces"
HOMEPAGE="https://github.com/naryl/cl-tui/"
SRC_URI="https://github.com/naryl/cl-tui/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-charms
	dev-lisp/trivial-types
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/split-sequence
	dev-lisp/cl-containers
	dev-lisp/osicat
"
BDEPEND=""
