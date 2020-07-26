# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-r3

DESCRIPTION="Event mechanism for Common Lisp objects"
HOMEPAGE="https://github.com/fukamachi/event-emitter"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fukamachi/event-emitter.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
