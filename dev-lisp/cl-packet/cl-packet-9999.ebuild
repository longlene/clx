# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Packet Codec and Protocol Analysis Library"
HOMEPAGE="https://github.com/mmaul/cl-packet"
#SRC_URI=""

EGIT_REPO_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/cl-annot
dev-lisp/cl-syslog
dev-lisp/flexi-streams
dev-lisp/split-sequence
"
