# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..15} )

inherit meson python-single-r1

DESCRIPTION="NVIDIA Inference Xfer Library"
HOMEPAGE="https://github.com/ai-dynamo/nixl"
SRC_URI="https://github.com/ai-dynamo/nixl/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0 MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda gds mooncake test ucx"
RESTRICT="!test? ( test )"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	${PYTHON_DEPS}
	>=dev-cpp/abseil-cpp-20240116.2:=
	dev-cpp/taskflow
	dev-cpp/tomlplusplus
	dev-python/pybind11[${PYTHON_SINGLE_USEDEP}]
	sys-libs/liburing:=
	cuda? ( dev-util/nvidia-cuda-toolkit:= )
	ucx? ( sys-cluster/ucx:= )
"
RDEPEND="${DEPEND}"
BDEPEND="${PYTHON_DEPS}"

src_configure() {
	local plugins=( POSIX OBJ )
	use ucx   && plugins+=( UCX )
	use gds   && plugins+=( GDS GDS_MT )
	use mooncake && plugins+=( MOONCAKE )

	local emesonargs=(
		--wrap-mode=nofallback
		-Denable_plugins=$(IFS=,; echo "${plugins[*]}")
		-Dbuild_tests=$(usex test true false)
		-Dbuild_examples=false
		-Drust=false
		-Ddisable_infinia_backend=true
		$(usex cuda "" "-Ddisable_gds_backend=true")
	)
	meson_src_configure
}

src_install() {
	meson_src_install

	# Install the nixl meta Python package (not handled by meson)
	local metadir="${S}/src/bindings/python/nixl-meta/nixl"
	python_moduleinto nixl
	python_domodule "${metadir}/__init__.py"
	python_domodule "${metadir}/_api.py"
	python_domodule "${metadir}/logging.py"
}
