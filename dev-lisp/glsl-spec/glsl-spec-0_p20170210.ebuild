# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5103b0aca826f92404cef3a863a1f03a2ee3f4e9"

DESCRIPTION="The GLSL spec as a datastructure"
HOMEPAGE="https://github.com/cbaggers/glsl-spec"
SRC_URI="https://github.com/cbaggers/glsl-spec/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
