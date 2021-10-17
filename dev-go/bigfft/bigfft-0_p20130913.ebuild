# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/remyoudompheng/bigfft"
EGIT_COMMIT="a8e77ddfb93284b9d58881f597c820a2875af336"

DESCRIPTION="Big integer multiplication library for Go using Fast Fourier transform"
HOMEPAGE="https://github.com/remyoudompheng/bigfft"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
