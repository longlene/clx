# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="20dd0b5c0fb1af5b5abf63bbb6278dc352c73eb1"

DESCRIPTION="A small Hidden Markov Model package in Common Lisp"
HOMEPAGE="https://github.com/AugustusHuang/cl-hmm"
SRC_URI="https://github.com/AugustusHuang/cl-hmm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
