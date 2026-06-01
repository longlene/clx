# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="787573d730161dcffc189c81ac92fd949289e492"

DESCRIPTION="A single header library to read .safetensors files from C"
HOMEPAGE="https://github.com/hsnyder/safetensors.h/"
SRC_URI="https://github.com/hsnyder/safetensors.h/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="public-domain"
SLOT="0"
S="${WORKDIR}"/safetensors.h-${EGIT_COMMIT}
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"

src_install() {
	doheader safetensors.h
	einstalldocs
}
