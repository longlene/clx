# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="448f925fbfea14f2aa268298d7de8f417e941a44"

DESCRIPTION="Message-passing Smalltalk-style object system"
HOMEPAGE="https://github.com/Kalimehtar/message-oo"
SRC_URI="https://github.com/Kalimehtar/message-oo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
