# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools git-r3

DESCRIPTION="Lightweight locally-aware user-level threading runtime"
HOMEPAGE="http://www.cs.sandia.gov/qthreads/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Qthreads/qthreads.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}
