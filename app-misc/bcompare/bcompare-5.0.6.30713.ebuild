# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Beyond Compare -- Compare, sync, and merge files and folders"
HOMEPAGE="https://www.scootersoftware.com/"
SRC_URI="https://www.scootersoftware.com/bcompare-${PV}.x86_64.tar.gz"

LICENSE="Bcompare"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="bindist"

REQUIRES_EXCLUDE="
	libbz2.so.1.0
	libkdecore.so.5
	libkio.so.5
"
QA_PRESTRIPPED="
	/opt/bcompare/lib/beyondcompare/libunrar.so
	/opt/bcompare/lib/beyondcompare/libcloudstorage.so.22.0
	/opt/bcompare/lib/beyondcompare/libQt5Pas.so.1
	/opt/bcompare/lib/beyondcompare/ext/bcompare_ext_konq.i386.so
	/opt/bcompare/lib/beyondcompare/ext/bcompare_ext_konq.amd64.so
	/opt/bcompare/lib/beyondcompare/ext/bcompare_ext_kde6.amd64.so
	/opt/bcompare/lib/beyondcompare/ext/bcompare_ext_kde5.amd64.so
	/opt/bcompare/lib/beyondcompare/ext/bcompare_ext_kde.i386.so
	/opt/bcompare/lib/beyondcompare/ext/bcompare_ext_kde.amd64.so
	/opt/bcompare/lib/beyondcompare/ext/bcompare-ext-thunarx-3.i386.so
	/opt/bcompare/lib/beyondcompare/ext/bcompare-ext-thunarx-3.amd64.so
	/opt/bcompare/lib/beyondcompare/ext/bcompare-ext-thunarx-2.i386.so
	/opt/bcompare/lib/beyondcompare/ext/bcompare-ext-thunarx-2.amd64.so
	/opt/bcompare/lib/beyondcompare/ext/bcompare-ext-nemo.i386.so
	/opt/bcompare/lib/beyondcompare/ext/bcompare-ext-nemo.amd64.so
	/opt/bcompare/lib/beyondcompare/ext/bcompare-ext-nautilus.i386.so
	/opt/bcompare/lib/beyondcompare/ext/bcompare-ext-nautilus.amd64.so.ext4
	/opt/bcompare/lib/beyondcompare/ext/bcompare-ext-nautilus.amd64.so
	/opt/bcompare/lib/beyondcompare/ext/bcompare-ext-caja.i386.so
	/opt/bcompare/lib/beyondcompare/ext/bcompare-ext-caja.amd64.so
	/opt/bcompare/lib/beyondcompare/lib7z.so
	/opt/bcompare/lib/beyondcompare/BCompare

"
QA_FLAGS_IGNORED="
"

src_unpack() {
	unpack ${A}
}

src_prepare() {
	default
	patchelf --remove-rpath ext/bcompare_ext_kde5.amd64.so || die
	patchelf --remove-rpath ext/bcompare_ext_kde6.amd64.so || die
	patchelf --remove-rpath ext/bcompare_ext_kde.amd64.so || die
	rm -v ext/*.i386.so
}

src_install() {
	local targetdir="/opt/bcompare"
	local LAUNCHER="bcompare/bin/bcompare"

	insinto "${targetdir}"
	sed -i ./install.sh -e 's/^# Create desktop entry and place.*/exit 0/g' || die
	sed -i ./install.sh -e "s%^# Copy the files.*%BC_BIN=\"$D/\$BC_BIN\"; BC_LIB=\"$D/\$BC_LIB\";%g" || die
	sed -i ./install.sh -e "s/^\texit 1.*//g" || die
	./install.sh --prefix="${targetdir}" || die

	dosym "../../opt/${LAUNCHER}" "/usr/bin/bcompare"
}
