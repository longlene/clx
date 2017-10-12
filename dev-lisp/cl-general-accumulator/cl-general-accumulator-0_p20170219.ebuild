# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8f2e22ad877c6ec8ef258148a6c5e41e18071c99"

DESCRIPTION="General-purpose, extensible value accumulator library for the Common Lisp language"
HOMEPAGE="https://github.com/tlikonen/cl-general-accumulator"
SRC_URI="https://github.com/tlikonen/cl-general-accumulator/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
