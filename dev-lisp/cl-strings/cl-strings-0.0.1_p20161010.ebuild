# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="dcba247731df21f0e6011f22c07e0bde8e90ac59"

DESCRIPTION="A portable, dependency-free set of utilities to manipulate strings in Common Lisp"
HOMEPAGE="https://github.com/diogoalexandrefranco/cl-strings"
SRC_URI="https://github.com/diogoalexandrefranco/cl-strings/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
