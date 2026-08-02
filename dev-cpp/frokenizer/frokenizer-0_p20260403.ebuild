# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

COMMIT="d1916c8bbcbf30766f4d3b2d3a48cc3e8754d1b5"

DESCRIPTION="Zero-allocation, header-only C++ BPE tokenizer for Qwen"
HOMEPAGE="https://github.com/yassa9/frokenizer"
SRC_URI="https://github.com/yassa9/frokenizer/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/frokenizer-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_compile() { :; }

src_install() {
	insinto /usr/include/frokenizer
	doins include/frokenizer.hpp
	insinto /usr/include/frokenizer/frokenizer_generated
	doins include/frokenizer_generated/baked.hpp
	doins include/frokenizer_generated/lexer.hpp
	einstalldocs
}
