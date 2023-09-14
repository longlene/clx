# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/hajimehoshi/go-openal/..."
EGIT_COMMIT="74c458dbab5523248e7557496af3ba46e10d7080"

DESCRIPTION="OpenAL bindings for Go"
HOMEPAGE="https://github.com/hajimehoshi/go-openal/"
SRC_URI="https://github.com/hajimehoshi/go-openal/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	media-libs/openal
"
RDEPEND="${DEPEND}"
