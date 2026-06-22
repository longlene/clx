# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_COMMIT="6aa2de8168540e78ce60548c3b713569b4a83468"

inherit cmake

DESCRIPTION="LLM inference engine implemented in C++ and CUDA"
HOMEPAGE="https://github.com/jmaczan/tiny-vllm"
SRC_URI="https://github.com/jmaczan/tiny-vllm/archive/${MY_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/tiny-vllm-${MY_COMMIT}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-util/nvidia-cuda-toolkit:="
RDEPEND="${DEPEND}"

src_install() {
	dobin "${S}_build/tiny-vllm"
	dodoc README.md
}
