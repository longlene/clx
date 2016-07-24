# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Simple and fast serialization of all kinds of Common Lisp data structures"
HOMEPAGE="https://github.com/wlbr/cl-marshal"
SRC_URI=""

EGIT_REPO_URI="https://github.com/wlbr/cl-marshal.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
