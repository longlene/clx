# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ed8ae7deb4250bf50838a0e6edf85eeea0ff938a"

DESCRIPTION="A library providing a universal application configuration mechanism"
HOMEPAGE="https://shinmera.github.io/ubiquitous"
SRC_URI="https://github.com/Shinmera/ubiquitous/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
"
