# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/teambition/trie-mux/..."

DESCRIPTION="A minimal and powerful trie based url path router (or mux) for Go"
HOMEPAGE="https://github.com/teambition/trie-mux"
SRC_URI="https://github.com/teambition/trie-mux/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
