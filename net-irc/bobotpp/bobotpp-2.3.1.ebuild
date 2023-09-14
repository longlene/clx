# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A Flexible IRC Bot"
HOMEPAGE="http://savannah.nongnu.org/projects/bobotpp"
SRC_URI="https://download.savannah.gnu.org/releases/bobotpp/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-scheme/guile
"
RDEPEND="${DEPEND}"
BDEPEND=""

