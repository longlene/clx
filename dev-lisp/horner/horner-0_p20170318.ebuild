# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a58c557e9f5f0eb836cde6182fe8cbdd7eeea7be"

DESCRIPTION="Inline polynomial evaluation using Horner's rule"
HOMEPAGE="https://github.com/TBRSS/horner/"
SRC_URI="https://github.com/TBRSS/horner/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
