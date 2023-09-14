# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/tevino/abool"
EGIT_COMMIT="3c25f2fe7cd0ef3eabefce1d90efd69a65d35b12"

DESCRIPTION="Atomic Boolean library for cleaner Golang code"
HOMEPAGE="https://github.com/tevino/abool"
SRC_URI="https://github.com/tevino/abool/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
