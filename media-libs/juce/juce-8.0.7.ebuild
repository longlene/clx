# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..14}  )
inherit python-single-r1 cmake desktop xdg-utils
# flag-o-matic
CMAKE_BUILD_TYPE=Release

MY_P="JUCE-${PV}"

DESCRIPTION="JUCE is class library for developing cross-platform applications."
HOMEPAGE=" http://www.juce.com"
SRC_URI="https://github.com/juce-framework/JUCE/archive/refs/tags/${PV}.tar.gz -> ${MY_P}.tar.gz"

S="${WORKDIR}/${MY_P}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug demo doc extras jack jucer ladspa"
REQUIRED_USE="( ${PYTHON_REQUIRED_USE} )"

# debian fst-dev ?=? media-libs/vst-sdk
# TODO: - fix the system libs patches
RDEPEND="( ${PYTHON_DEPS} )
	dev-build/cmake
	>=media-libs/alsa-lib-0.9
	net-misc/curl
	media-libs/flac
	=media-libs/freetype-2*
	media-libs/freeglut
	media-libs/libjpeg-turbo
	media-libs/libpng
	media-libs/libvorbis
	media-libs/lv2
	media-libs/mesa
	media-libs/vst-sdk
	net-libs/webkit-gtk:4
	x11-libs/gtk+
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXext
	x11-libs/libXinerama
	x11-libs/libXrandr
	x11-libs/libXrender
	virtual/pkgconfig
	sys-libs/zlib
	app-text/doxygen
	media-gfx/graphviz
	jack? ( virtual/jack )
	ladspa? ( media-libs/ladspa-sdk )"

DEPEND="${RDEPEND}
	doc? ( app-text/doxygen )"

PATCHES=( "${FILESDIR}/01_system_modules.patch"
	"${FILESDIR}/02_python3-doxygen.patch"
	"${FILESDIR}/03_doxygen-outdir.patch"
	"${FILESDIR}/04_unittests_globalpaths.patch"
	"${FILESDIR}/07_cmake.patch" )
# "${FILESDIR}/00_fixed-defines.patch"
#	"${FILESDIR}/05_link_systemlibs.patch"
#	"${FILESDIR}/06_buildcmake.patch"

EXTRAS_PKG_BUILD=(
	AudioPerformanceTest
	AudioPluginHost
	BinaryBuilder
	NetworkGraphicsDemo
	UnitTestRunner
)

src_prepare() {
	cmake_src_prepare

	einfo "Patching lv2 helper path..."
	sed -i -e 's:bin/JUCE-${JUCE_VERSION}:bin:' "${S}/CMakeLists.txt" || die "sed lv2 helper path failed"

	if use jucer; then
		if ! use debug; then
			einfo "Patching for non debug build..."
			sed -i -e 's:CONFIG=Debug:CONFIG=Release:' -e 's:-g -ggdb ::' -e 's:"-DDEBUG=1" ::g' -e 's:"-D_DEBUG=1" ::g' \
				-e 's:"-DNDEBUG=1" ::g' "${S}/extras/Projucer/Builds/LinuxMakefile/Makefile" || die "sed debug flags failed"
		fi
	fi

if use extras; then
	for i in "${EXTRAS_PKG_BUILD[@]}"; do
			einfo "Patching ${i}..."
			sed -i -e 's:CONFIG=Debug:CONFIG=Release:' -e 's:-g -ggdb ::' -e 's:"-DDEBUG=1" ::g' -e 's:"-D_DEBUG=1" ::g' \
				-e 's:"-DNDEBUG=1" ::g' "${S}/extras/${i}/Builds/LinuxMakefile/Makefile" || die "sed debug flags for ${i} failed"
		done
	fi
}

src_configure() {
#	append-cppflags -DDEBIAN_JUCERPROJECT_LIBS="atomic"
#	append-ldflags -latomic

	local mycmakeargs=(
		-DJUCE_COPY_PLUGIN_AFTER_BUILD=ON
		-DJUCE_MODULE_PATH=share/juce/modules
		-DJUCE_INSTALL_DESTINATION=share/juce
		-DJUCE_TOOL_INSTALL_DIR=bin
		$(use debug && echo -DCMAKE_BUILD_TYPE=Debug)
		$(use demo && echo -DJUCE_BUILD_EXAMPLES=ON)
		$(use extras && echo -DJUCE_BUILD_EXTRAS=ON)
		$(use jack || echo -DJUCE_JACK=0)
		$(use ladspa || echo -DJUCE_PLUGINHOST_LADSPA=0)
	)
	cmake_src_configure
}

src_compile() {
	if use jucer; then
		cd "${S}"/extras/Projucer/Builds/LinuxMakefile || die "cd S failed"
		einfo "Building Projucer..."
		#V="1" emake
		emake
	fi

	cmake_src_compile

	if use doc; then
		cd "${S}/docs/doxygen" || die "cd doc failed"
		emake
	fi

	mv "${S}/examples/Assets/juce_icon.png Projucer.png"
}

src_install() {
	if use jucer; then
		einfo "Installing Projucer..."
		dobin "${S}/extras/Projucer/Builds/LinuxMakefile/build/Projucer"
	fi

	cmake_src_install
	doman "${FILESDIR}/Projucer.1"
	insinto /usr/share/applications
	doins "${FILESDIR}/Projucer.desktop"
	insinto /usr/share/pixmaps
	newins "${S}/examples/Assets/juce_icon.png" Projucer.png
	insinto /usr/share/mime/application
	doins "${FILESDIR}/juce-tools.xml"

	if use extras; then
		for i in "${EXTRAS_PKG_BUILD[@]}"; do
			einfo "Installing ${i}..."
			dobin "${S}_build/extras/${i}/${i}_artefacts/Release/${i}" || die "cd ${i} failed"
		done
	fi

	if use doc; then
		einfo "Installing html documentation..."
		local HTML_DOCS=( docs/doxygen/apiref/. )
		einfo HTML_DOCS="${HTML_DOCS}"
		einstalldocs
	fi

	# don't install .cpp files
	for i in `find "${D}"/usr/include/"${MY_P}"/modules -name *.cpp`; do
		rm -f $i
	done
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	xdg_mimeinfo_database_update
}

#	if use multilib; then
#		insinto /usr/lib32
#		doins bin/libjuce.a
#		insinto /usr/lib64
#		newins "${WORKDIR}"/lib64juce.a libjuce.a
#	else
#		dolib bin/*.a
#	fi
#	use demo && dobin "extras/JuceDemo/Builds/Linux/build/JuceDemo"
#	use jucer && dobin "extras/the jucer/build/linux/build/jucer"
#	use introjucer && dobin "extras/Introjucer/Builds/Linux/build/Introjucer"
#	docinto /usr/share/doc/"${P}"
#	doins docs/*.html docs/*.css docs/*.txt
#	mv docs/images "${D}"/usr/share/doc/"${P}"
#	insinto /usr/include/"${PN}"
#	doins *.h
	# remove unneded sources
#	rm -rf src/juce_appframework/audio/audio_file_formats/flac
#	rm -rf src/juce_appframework/audio/audio_file_formats/oggvorbis
#	rm -rf src/juce_appframework/gui/graphics/imaging/image_file_formats/jpglib
#	rm -rf src/juce_appframework/gui/graphics/imaging/image_file_formats/pnglib
#	cp -R src "${D}"/usr/include/"${PN}"
