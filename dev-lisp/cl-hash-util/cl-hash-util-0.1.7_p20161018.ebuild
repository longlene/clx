# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="22033d69a10becf5cc9d92bb98263ebb4bbee856"

DESCRIPTION="A small hash utility library for Common Lisp"
HOMEPAGE="https://github.com/orthecreedence/cl-hash-util"
SRC_URI="https://github.com/orthecreedence/cl-hash-util/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
