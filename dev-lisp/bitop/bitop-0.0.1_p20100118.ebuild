# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f4ab20d46775cbe7e5038773a10423f1432788ad"

DESCRIPTION="A Common Lisp library for bitwise operations"
HOMEPAGE="https://github.com/sile/bitop"
SRC_URI="https://github.com/sile/bitop/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
