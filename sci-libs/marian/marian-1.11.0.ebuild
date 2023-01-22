# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

DESCRIPTION="Fast Neural Machine Translation in C++"
HOMEPAGE="https://marian-nmt.github.io/"
SRC_URI="
	https://github.com/marian-nmt/marian/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/marian-nmt/FBGEMM/archive/6f45243cb8ab7d7ab921af18d313ae97144618b8.tar.gz -> fbgemm-6f45243cb8ab7d7ab921af18d313ae97144618b8.tar.gz
	https://github.com/marian-nmt/intgemm/archive/8abde25b13c3ab210c0dec8e23f4944e3953812d.tar.gz -> intgemm-8abde25b13c3ab210c0dec8e23f4944e3953812d.tar.gz
	https://github.com/marian-nmt/sentencepiece/archive/c307b874deb5ea896db8f93506e173353e66d4d3.tar.gz -> sentencepiece-c307b874deb5ea896db8f93506e173353e66d4d3.tar.gz
	https://github.com/marian-nmt/Simple-WebSocket-Server/archive/1d7e84aeb3f1ebdc78f6965d79ad3ca3003789fe.tar.gz -> Simple-WebSocket-Server-1d7e84aeb3f1ebdc78f6965d79ad3ca3003789fe.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="cuda +mkl"

DEPEND="
	dev-libs/boost
	dev-libs/openssl
	cuda? ( dev-util/nvidia-cuda-toolkit
			x11-drivers/nvidia-drivers )
	mkl? ( sci-libs/mkl )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rmdir src/3rd_party/fbgemm && ln -sv "${WORKDIR}"/fbgemm-6f45243cb8ab7d7ab921af18d313ae97144618b8 src/3rd_party/fbgemm
	rmdir src/3rd_party/intgemm && ln -sv "${WORKDIR}"/intgemm-8abde25b13c3ab210c0dec8e23f4944e3953812d src/3rd_party/intgemm
	rmdir src/3rd_party/sentencepiece && ln -sv "${WORKDIR}"/sentencepiece-c307b874deb5ea896db8f93506e173353e66d4d3 src/3rd_party/sentencepiece
	rmdir src/3rd_party/simple-websocket-server && ln -sv "${WORKDIR}"/Simple-WebSocket-Server-1d7e84aeb3f1ebdc78f6965d79ad3ca3003789fe src/3rd_party/simple-websocket-server
	sed -e '/git submodule/,/)/d' \
		-e 's#-Werror;##' \
		-i CMakeLists.txt
	sed -e '/set(MARIAN_GIT_DIR/,/add_dependencies(marian marian_version)/d' \
		-i src/CMakeLists.txt
	echo "#define GIT_REVISION \"${PV}\"" > src/common/git_revision.h
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DCOMPILE_CUDA=$(usex cuda)
		-DCOMPILE_SERVER=ON
		-DUSE_DOXYGEN=OFF
		-DUSE_MKL=$(usex mkl)
		-DUSE_NCCL=OFF
		-DUSE_SENTENCEPIECE=OFF
	)
	cmake_src_configure
}

src_install() {
	dobin "${BUILD_DIR}"/{marian-conv,marian-scorer,marian-vocab,marian,marian-decoder,marian-server}
	einstalldocs
}
