# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/go-gl/gl/..."
EGIT_COMMIT="b303bcb3e83b7ef645a5104e1c2db7f8d9e8918a"

DESCRIPTION="Go bindings for OpenGL"
HOMEPAGE="https://github.com/go-gl/gl"
SRC_URI="https://github.com/go-gl/gl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	virtual/opengl
"
RDEPEND="${DEPEND}"
