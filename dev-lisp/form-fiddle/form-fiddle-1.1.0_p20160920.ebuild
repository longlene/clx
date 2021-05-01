# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="adbf4e51a9bb2b407b216d96e104453a8001e2b8"

DESCRIPTION="A collection of utilities to destructure lambda forms"
HOMEPAGE="https://github.com/Shinmera/form-fiddle"
SRC_URI="https://github.com/Shinmera/form-fiddle/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
"
