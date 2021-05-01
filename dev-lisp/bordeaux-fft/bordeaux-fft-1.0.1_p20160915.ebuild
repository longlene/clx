# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="471787ad86a7d7ce65877ca092a65af48f6f5e91"

DESCRIPTION="An efficient and portable implementation of the Fast Fourier Transform in Common Lisp"
HOMEPAGE="https://github.com/ahefner/bordeaux-fft"
SRC_URI="https://github.com/ahefner/bordeaux-fft/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
