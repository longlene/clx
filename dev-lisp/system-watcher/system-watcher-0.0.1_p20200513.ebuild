# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a089a2ff2280b1420fa91c25241a4b1d3a6b820e"

DESCRIPTION="A tool that let's you continually run your tests in a terminal while
you code"
HOMEPAGE="https://github.com/pve1/system-watcher"
SRC_URI="https://github.com/pve1/system-watcher/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/apply-argv
	dev-lisp/alexandria
	dev-lisp/shell-utility
"
BDEPEND=""
