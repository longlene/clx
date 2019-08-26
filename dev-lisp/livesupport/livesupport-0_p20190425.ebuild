# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="71e6e412df9f3759ad8378fabb203913d82e228a"

DESCRIPTION="Some helpers that make livecoding with slime/sly a little easier"
HOMEPAGE="https://github.com/cbaggers/livesupport"
SRC_URI="https://github.com/cbaggers/livesupport/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
