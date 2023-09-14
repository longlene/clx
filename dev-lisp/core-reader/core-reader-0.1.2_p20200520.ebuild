# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bf9ba7e19b763d32633a3084d361d5d74a79aeac"

DESCRIPTION="Utilities for stream oriented reader"
HOMEPAGE="https://github.com/hyotang666/core-reader"
SRC_URI="https://github.com/hyotang666/core-reader/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
