# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="Very simple thread-safe channels with timeout"
HOMEPAGE="https://github.com/rpav/trivial-channels"
SRC_URI=""

EGIT_REPO_URI="https://github.com/rpav/trivial-channels.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/trivial-timeout
"
