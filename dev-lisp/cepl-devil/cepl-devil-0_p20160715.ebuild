# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="00d2578288a9b6c9387c3d4b93613975eed92795"

DESCRIPTION="A couple of helper functions to load from devil straight to cepl c-arrays or textures"
HOMEPAGE="https://github.com/cbaggers/cepl.devil"
SRC_URI="https://github.com/cbaggers/cepl.devil/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cepl
	dev-lisp/cl-devil
"
