# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="821986ad17647bbed373e0b5ceeaa7886f50b331"

DESCRIPTION="Monadic parsing for Common Lisp"
HOMEPAGE="https://github.com/massung/parse"
SRC_URI="https://github.com/massung/parse/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
