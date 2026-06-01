# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit flag-o-matic toolchain-funcs

DESCRIPTION="Small native inference engine for DeepSeek V4 Flash models"
HOMEPAGE="https://github.com/antirez/ds4"

MY_COMMIT="22393e770ea8eb7501d8718d6f66c6374004e03f"
SRC_URI="https://github.com/antirez/ds4/archive/${MY_COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/ds4-${MY_COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda"

DEPEND="cuda? ( dev-util/nvidia-cuda-toolkit )"
RDEPEND="${DEPEND}"

src_compile() {
	filter-flags -march=native -mcpu=native
	if use cuda; then
		emake cuda-generic CC="$(tc-getCC)" CUDA_HOME="${EPREFIX}/opt/cuda"
	else
		emake cpu CC="$(tc-getCC)"
	fi
}

src_install() {
	dobin ds4 ds4-server ds4-bench ds4-eval ds4-agent
	einstalldocs
}
