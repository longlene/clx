# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )
inherit python-any-r1 vcs-snapshot

DESCRIPTION="V8 JavaScript Engine"
HOMEPAGE="https://github.com/v8/v8"
#https://github.com/v8/v8/archive/${PV}.tar.gz -> ${P}.tar.gz
SRC_URI="https://chromium.googlesource.com/chromium/tools/depot_tools/+archive/544b744621b7c60097788c38594ea44973d0c8eb.tar.gz -> depot_tools-0_p20180316.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

export PATH=${PATH}:"${WORKDIR}"

S="${WORKDIR}"/v8

src_unpack() {
	default
	fetch v8 || die "unpack failed"
}

src_configure() {
	#gn gen out.gn/Release \
	#-vv --fail-on-unused-args \
	#--args="clang_base_path=\"/usr/lib/llvm/6\"
	#is_clang=false
	#is_component_build=true
	#is_debug=false
	#is_official_build=false
	#treat_warnings_as_errors=false
	#v8_enable_i18n_support=true
	#v8_use_external_startup_data=\"\"
	#use_sysroot=false" || die "configure failed"
	./tools/dev/v8gen.py x64.release || die "configure failed"
}

src_compile() {
	ninja -C out.gn/x64.release || die "compile failed"
}
