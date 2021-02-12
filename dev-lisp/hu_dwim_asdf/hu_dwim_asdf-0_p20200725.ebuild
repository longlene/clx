# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="67cdf84390e530af4303cc4bc815fdf2a5e48f59"

DESCRIPTION="Various ASDF extensions"
HOMEPAGE="http://dwim.hu/project/hu.dwim.asdf"
SRC_URI="https://github.com/hu-dwim/hu.dwim.asdf/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
