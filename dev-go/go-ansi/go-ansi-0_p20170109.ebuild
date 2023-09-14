# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/k0kubun/go-ansi"
EGIT_COMMIT="c49b5436b29d52b735097d449e59d9794833bafe"

DESCRIPTION="Windows-portable ANSI escape sequence utility for Go language"
HOMEPAGE="https://github.com/k0kubun/go-ansi"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
