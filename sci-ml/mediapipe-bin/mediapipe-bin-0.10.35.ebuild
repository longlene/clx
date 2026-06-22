# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..14} )
inherit python-single-r1

DESCRIPTION="Cross-platform, customizable ML solutions for live and streaming media"
HOMEPAGE="https://ai.google.dev/edge/mediapipe"
SRC_URI="https://files.pythonhosted.org/packages/32/8f/1bc57dbc9b7b03c8f875aac23380ec57e9002cc02fe6720045fb263f3966/mediapipe-0.10.35-py3-none-manylinux_2_28_x86_64.whl -> ${P}.whl"

S="${WORKDIR}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

# libmediapipe.so bundles abseil, protobuf, tflite, xnnpack compiled by Bazel
QA_PREBUILT="usr/lib*/python*/site-packages/mediapipe/tasks/c/libmediapipe.so"

RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/absl-py[${PYTHON_USEDEP}]
		dev-python/certifi[${PYTHON_USEDEP}]
		dev-python/flatbuffers[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/sounddevice[${PYTHON_USEDEP}]
		media-libs/opencv[contrib,python,${PYTHON_USEDEP}]
	')
	virtual/opengl
"
BDEPEND="app-arch/unzip"

src_unpack() {
	unzip "${DISTDIR}/${P}.whl" -d "${WORKDIR}" || die
}

src_install() {
	local sitedir
	sitedir="$(python_get_sitedir)"

	# Remove pre-compiled bytecode; portage regenerates it via python_optimize
	find mediapipe -name '__pycache__' -type d -exec rm -rf {} + 2>/dev/null || true
	# Remove test files; one contains invalid Unicode that breaks py_compile
	rm -rf mediapipe/tasks/python/test || die

	insinto "${sitedir}"
	doins -r mediapipe
	doins -r "mediapipe-${PV}.dist-info"

	fperms 0755 "${sitedir}/mediapipe/tasks/c/libmediapipe.so"

	python_optimize "${ED}${sitedir}/mediapipe"
}
