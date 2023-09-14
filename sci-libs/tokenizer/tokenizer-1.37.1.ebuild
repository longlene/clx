# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="OpenNMT C++ tokenizer"
HOMEPAGE="https://github.com/OpenNMT/Tokenizer"
SRC_URI="
	https://github.com/OpenNMT/Tokenizer/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/jarro2783/cxxopts/archive/refs/tags/v3.0.0.tar.gz -> cxxopts-3.0.0.tar.gz
	https://github.com/google/sentencepiece/archive/refs/tags/v0.1.96.tar.gz -> sentencepiece-0.1.96.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default
	rmdir third_party/cxxopts && ln -sv "${WORKDIR}"/cxxopts-3.0.0 third_party/cxxopts
	rmdir third_party/sentencepiece && ln -sv "${WORKDIR}"/sentencepiece-0.1.96 third_party/sentencepiece
	cmake_src_prepare
}
