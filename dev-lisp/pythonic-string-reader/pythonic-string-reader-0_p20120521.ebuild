# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c8cd347e862858aa5489ae6804e553f5b2959111"

DESCRIPTION="A simple and unintrusive read table modification inspired by Python's three quote strings"
HOMEPAGE="https://github.com/smithzvk/pythonic-string-reader"
SRC_URI="https://github.com/smithzvk/pythonic-string-reader/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
