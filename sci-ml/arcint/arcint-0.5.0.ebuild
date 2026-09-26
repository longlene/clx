# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..15} )

inherit cmake python-single-r1

DESCRIPTION="Narrow LLM inference engine for Intel Arc GPUs"
HOMEPAGE="https://github.com/marfrit/arcint"
SRC_URI="https://github.com/marfrit/arcint/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0 MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="openvino python test"
RESTRICT="!test? ( test )"
REQUIRED_USE="
	test? ( python )
	python? ( ${PYTHON_REQUIRED_USE} )
"

RDEPEND="
	dev-cpp/cpp-httplib
	dev-cpp/nlohmann_json
	openvino? ( sci-ml/openvino:0= )
	python? ( ${PYTHON_DEPS} )
"
DEPEND="${RDEPEND}"
BDEPEND="
	test? (
		net-misc/curl
	)
"

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_prepare() {
	eapply "${FILESDIR}"/${P}-system-deps.patch
	# The system packages provide cpp-httplib and nlohmann/json; only the
	# locally patched minja (chat-template 'undefined' operator) stays
	# vendored in third_party/.
	rm -rf third_party/nlohmann third_party/httplib.h || die
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DARCINT_OPENVINO=$(usex openvino)
		-DARCINT_TESTS=$(usex test)
	)
	cmake_src_configure
}

src_test() {
	# Device-free gate per docs/design-0.3.1-test-ladder.md: unit tests,
	# HTTP round trip, stub concurrency stress, enumeration self-checks.
	cmake_src_test -L unit
}
