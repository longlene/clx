# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5a2cad2c681f3d8244059cfe0aa3f3e750bfa1d5"

DESCRIPTION="Reader macros for concise expression of function partial application and composition"
HOMEPAGE="http://eschulte.github.io/curry-compose-reader-macros"
SRC_URI="https://github.com/eschulte/curry-compose-reader-macros/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/named-readtables
"
