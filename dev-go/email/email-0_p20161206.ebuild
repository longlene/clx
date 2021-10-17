# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/nilslice/email"
EGIT_COMMIT="64c3efa303b70ea8a3f5419e2efc61a92d0a6e63"

DESCRIPTION="Minimal SMTP client in Go"
HOMEPAGE="https://github.com/nilslice/email"
SRC_URI="https://github.com/nilslice/email/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
