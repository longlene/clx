# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/derekparker/trie"
EGIT_COMMIT="99ba9900fa2c45475da655bbf7f869461fc04165"

DESCRIPTION="Data structure and relevant algorithms for extremely fast prefix/fuzzy string searching"
HOMEPAGE="https://github.com/derekparker/trie"
SRC_URI="https://github.com/derekparker/trie/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
