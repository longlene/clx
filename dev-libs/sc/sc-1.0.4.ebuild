# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Common libraries and data structures for C"
HOMEPAGE="https://github.com/tezc/sc"
SRC_URI="https://github.com/tezc/sc/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DSC_BUILD_TEST=OFF
	)
	cmake_src_configure
}

src_install() {
	insinto /usr/include
	doins array/sc_array.h buffer/sc_buf.h condition/sc_cond.h crc32/sc_crc32.h heap/sc_heap.h ini/sc_ini.h linked-list/sc_list.h logger/sc_log.h map/sc_map.h memory-map/sc_mmap.h mutex/sc_mutex.h option/sc_option.h perf/sc_perf.h queue/sc_queue.h sc/sc.h signal/sc_signal.h socket/sc_sock.h string/sc_str.h thread/sc_thread.h timer/sc_timer.h time/sc_time.h uri/sc_uri.h
	dolib.so ${BUILD_DIR}/*/*.so
	dodoc README.md
}
