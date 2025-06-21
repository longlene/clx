# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c990b1f408750622ba63b903cfc0091d7df07b14"

DESCRIPTION="Functions to generate various types of noise such as Perlin or Value noise"
HOMEPAGE="https://github.com/Shinmera/random-noise"
SRC_URI="https://github.com/Shinmera/random-noise/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
"
BDEPEND=""
