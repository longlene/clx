# Copyright 2018 Jan Chren (rindeal)
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools vcs-snapshot

DESCRIPTION="Project for extended camera features (image quality improvement, video analysis)"
HOMEPAGE="https://github.com/intel/libxcam"
SRC_URI="https://github.com/intel/libxcam/archive/release_${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"

KEYWORDS="~amd64"
IUSE="
	+shared-libs static-libs debug profiling
	drm
	gst
	libcl
	opencv
	+capi
	smartlib
	doc
	gnu-ld
"

CDEPEND="
	drm? ( x11-libs/libdrm )
	libcl? ( virtual/opencl )
	libcl? ( drm? ( dev-libs/beignet ) )
	>=media-libs/opencv-3
	gst? (
			media-libs/gstreamer:1.0
			media-libs/gst-plugins-base:1.0
	)
"
DEPEND="${CDEPEND}
	doc? ( app-doc/doxygen )
"
RDEPEND="${CDEPEND}"

pkg_setup() {
	if use libcl && use drm && [[ "$(eselect opencl show)" != "beignet" ]] ; then
		die "USE='libc drm' requires 'beignet' opencl provider, issue: 'eselect opencl set beignet' to set it"
	fi
}

src_prepare() {
	eapply_user

	sed -e "s| -fstack-protector||" -i -- configure.ac

	eautoreconf
}

src_configure() {
	local my_econf_args=(
		$(use_enable shared-libs shared)
		$(use_enable static-libs static)
		$(use_enable debug)
		$(use_enable profiling)
		$(use_enable drm)
		--disable-aiq
		$(use_enable gst)
		$(use_enable libcl)
		$(use_enable opencv)
		$(use_enable capi)
		$(use_enable doc docs)
		--disable-3alib
		$(use_enable smartlib)
		$(use_with gnu-ld)
	)
	econf "${my_econf_args[@]}"
}
