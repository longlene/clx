# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Common Lisp implementation of event recording/replay for the Robotics Service Bus"
HOMEPAGE="https://github.com/open-rsx/rsbag-cl"
SRC_URI="https://github.com/open-rsx/rsbag-cl/archive/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/split-sequence
	dev-lisp/let-plus
	dev-lisp/iterate
	dev-lisp/more-conditions
	dev-lisp/log4cl
	dev-lisp/bordeaux-threads
	dev-lisp/lparallel
	dev-lisp/local-time
	dev-lisp/nibbles
	dev-lisp/pileup
"
BDEPEND=""
