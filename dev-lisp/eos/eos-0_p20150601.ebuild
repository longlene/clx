# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b0faca83781ead9a588661e37bd47f90362ccd94"
DESCRIPTION="Eos is a drop-in replacement for the FiveAM Test Framework"
HOMEPAGE="https://github.com/adlai/Eos
	http://www.cliki.net/Eos"
SRC_URI="https://github.com/adlai/Eos/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

RDEPEND=""
