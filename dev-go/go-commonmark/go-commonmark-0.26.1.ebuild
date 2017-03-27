# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/rhinoman/go-commonmark"

DESCRIPTION="CommonMark wrapper for Go"
HOMEPAGE="https://github.com/rhinoman/go-commonmark"
SRC_URI="https://github.com/rhinoman/go-commonmark/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
