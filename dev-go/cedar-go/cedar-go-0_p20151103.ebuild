# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/adamzy/cedar-go"
EGIT_COMMIT="d348c21f72432c2b6d5f05f68759fde94f64b227"

DESCRIPTION="A go implemention of efficiently-updatable double-array trie"
HOMEPAGE="https://github.com/adamzy/cedar-go"
SRC_URI="https://github.com/adamzy/cedar-go/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
