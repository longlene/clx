# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Hacker News in the terminal"
HOMEPAGE="https://hnterm.ggerganov.com/"
SRC_URI="
	https://github.com/ggerganov/hnterm/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/ggerganov/imtui/archive/203b2320c02949e40aab442f86a1487b34c89470.tar.gz -> imtui-203b2320c02949e40aab442f86a1487b34c89470.tar.gz
	https://github.com/ggerganov/imgui/archive/4e0ce6f1df52fa40b105c96820eec60b4fb2a658.tar.gz -> imgui-4e0ce6f1df52fa40b105c96820eec60b4fb2a658.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rmdir third-party/imtui && ln -sv "${WORKDIR}"/imtui-203b2320c02949e40aab442f86a1487b34c89470 third-party/imtui
	rmdir third-party/imtui/third-party/imgui/imgui && ln -sv "${WORKDIR}"/imgui-4e0ce6f1df52fa40b105c96820eec60b4fb2a658 third-party/imtui/third-party/imgui/imgui
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=OFF
	)
	cmake_src_configure
}
