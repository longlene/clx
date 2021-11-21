# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font vcs-snapshot

EGIT_COMMIT="d258639b562cab674da79e9e3316998e709e8960"

DESCRIPTION="A monospaced sans-serif typeface, used in Mac OS X"
HOMEPAGE="https://github.com/todylu/monaco.ttf"
SRC_URI="https://github.com/todylu/monaco.ttf/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

FONT_SUFFIX="ttf"

