# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/cznic/internal/..."

DESCRIPTION="buffer, file, slice packages"
HOMEPAGE="https://github.com/cznic/internal"
SRC_URI="https://github.com/cznic/internal/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/fileutil
	dev-go/mmap-go
"
RDEPEND="${DEPEND}"
