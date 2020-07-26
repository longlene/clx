# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools vcs-snapshot

EGIT_COMMIT="72beac9c58c5af06f5a67a5be34a80cc17ff4a3f"

DESCRIPTION="An ultra-lightweight, portable, single-file, simple-as-can-be ANSI-C compliant JSON parser"
HOMEPAGE="https://github.com/pohuguet/cJSON http://sourceforge.net/projects/cjson/"
SRC_URI="https://github.com/pohuguet/cJSON/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}
