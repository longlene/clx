# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_OPTIONAL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit cmake distutils-r1

DESCRIPTION="Multi-Joint dynamics with Contact"
HOMEPAGE="https://mujoco.org/"
SRC_URI="https://github.com/deepmind/mujoco/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="python"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

DEPEND="
	media-libs/qhull
"
RDEPEND="
	${DEPEND}
	python? (
		${PYTHON_DEPS}
		dev-python/absl-py[${PYTHON_USEDEP}]
		dev-python/etils[${PYTHON_USEDEP}]
		dev-python/glfw[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pyopengl[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	python? (
		${DISTUTILS_DEPS}
		dev-python/pybind11
	)
"

wrap_python() {
	if use python; then
		pushd python > /dev/null || die
		local phase=$1
		distutils-r1_${phase} "$@"
		popd > /dev/null || die
	fi
}

pkg_setup() {
	use python && python_setup
}

src_prepare() {
	sed -e '/Werror/d' -i cmake/MujocoOptions.cmake || die
	if use python; then
		# python/mujoco/cmake/ does not exist in the tarball; redirect to cmake/
		sed -e "s|dirname(__file__), 'mujoco', 'cmake'|dirname(os.path.abspath(__file__)), os.pardir, 'cmake'|" \
			-i python/setup.py || die
		# python/mujoco/simulate/ does not exist in the tarball; _simulate only
		# provides the interactive viewer (mujoco.viewer), not core simulation
		# Run perl first (needs _simulate target name in place to match the block)
		perl -i -0pe \
			's/mujoco_pybind11_module\(_simulate simulate\.cc\)\ntarget_link_libraries\(\n  _simulate\n(?:[^\n]*\n)*\)\n\n//' \
			python/mujoco/CMakeLists.txt || die
		sed -e '/add_subdirectory(simulate)/d' \
			-e '/TARGET_FILE:_simulate/d' \
			-e '/^    _simulate$/d' \
			-i python/mujoco/CMakeLists.txt || die
		sed -e "/CMakeExtension('mujoco._simulate')/d" \
			-i python/setup.py || die
		# cmake 4.x validates INTERFACE library sources at configure time, and the
		# codegen scripts use mujoco_SOURCE_DIR which is unset in standalone builds.
		# Pre-generate all three headers so cmake's if(EXISTS) branches are taken.
		# addwrite: Python 3.14 tries to set its own process name via /proc/self/comm
		addwrite /proc/self/comm
		(
			cd python/mujoco || die
			PYTHONPATH="${S}/python/mujoco" \
				python3 codegen/generate_enum_traits.py > enum_traits.h || die
			PYTHONPATH="${S}/python/mujoco" \
				python3 codegen/generate_function_traits.py > function_traits.h || die
			PYTHONPATH="${S}/python/mujoco" \
				python3 codegen/generate_spec_bindings.py > specs.cc.inc || die
		)
	fi
	cmake_src_prepare
	wrap_python ${FUNCNAME}
}

src_configure() {
	local mycmakeargs=(
		-DMUJOCO_BUILD_EXAMPLES=OFF
		-DMUJOCO_BUILD_SIMULATE=OFF
		-DMUJOCO_BUILD_TESTS=OFF
		-DMUJOCO_TEST_PYTHON_UTIL=OFF
	)
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
	if use python; then
		# Build a minimal in-tree prefix so setup.py's _find_mujoco() can locate
		# the library and headers without an installed copy of mujoco.
		# os.walk does not follow directory symlinks; the library file is symlinked
		# directly into the prefix root so that filenames-based scanning finds it.
		# os.path.exists (used for include discovery) does follow symlinks.
		mkdir -p "${T}/mj_prefix/include" "${T}/mj_plugins" || die
		ln -sf "${BUILD_DIR}/lib64/libmujoco.so" \
			"${T}/mj_prefix/libmujoco.so" || die
		ln -sf "${BUILD_DIR}/lib64/libmujoco.so.${PV}" \
			"${T}/mj_prefix/libmujoco.so.${PV}" || die
		ln -sf "${S}/include/mujoco" "${T}/mj_prefix/include/mujoco" || die
		local f
		for f in "${BUILD_DIR}"/lib64/lib*.so; do
			[[ ${f} == *libmujoco* ]] && continue
			ln -sf "${f}" "${T}/mj_plugins/" || die
		done
		MUJOCO_PATH="${T}/mj_prefix" \
		MUJOCO_PLUGIN_PATH="${T}/mj_plugins" \
		MUJOCO_CMAKE_ARGS="-DMUJOCO_PYTHON_USE_SYSTEM_PYBIND11=ON" \
			wrap_python src_compile
	fi
}

src_install() {
	cmake_src_install
	wrap_python src_install
	if use python; then
		# libmujoco.so is provided system-wide by sci-libs/mujoco; remove the
		# copy bundled into the Python package for PyPI distribution
		find "${D}" -path "*/mujoco/libmujoco*.so*" -delete || die
	fi
}
