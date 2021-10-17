# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/mitchellh/go-homedir"
EGIT_COMMIT="b8bc1bf767474819792c23f32d8286a45736f1c6"

DESCRIPTION="Go library for detecting and expanding the user's home directory without cgo"
HOMEPAGE="https://github.com/mitchellh/go-homedir"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
