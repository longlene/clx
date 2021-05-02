# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit games

MY_PN="Minecraft"

DESCRIPTION="Minecraft is a game about placing blocks while running from skeletons. Or something like that.."
HOMEPAGE="http://www.minecraft.net"

SRC_URI=""
URI="http://www.minecraft.net/download/Minecraft.jar"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-misc/wget"
RDEPEND="dev-java/sun-jdk
	 x11-apps/xrandr
	 x11-libs/libX11
	 x11-libs/libXau
	 x11-libs/libxcb
	 x11-libs/libXcursor
	 x11-libs/libXdmcp
	 x11-libs/libXext
	 x11-libs/libXrandr"

GAMEDIR="${GAMES_PREFIX_OPT}/${PN}"

src_prepare() {
	# Download:
	wget "${URI}" -O "${PN}.jar" || die "wget of \"${PN}.jar\" failed"

	cp "${FILESDIR}/${PN}.png" "${PN}.png" || die "cp of \"${PN}.png\" failed"
}

src_install() {
	# Install data
	insinto "${GAMEDIR}" || die "insinto \"${GAMEDIR}\" failed"

	doins "${PN}.jar" || die "doins of \"${PN}.jar\" failed"

	# Make game wrapper
	mkdir -p "${D}/${GAMES_BINDIR}" || die "mkdir \"${D}/${GAMES_BINDIR}\" failed"

	local wrapper="${D}/${GAMES_BINDIR}/${PN}"
	touch "${wrapper}" || die "touch \"${wrapper}\" failed"

	cat << EOF >> "${wrapper}" || die "cat failed"
#!/bin/sh
cd "${GAMEDIR}"
java -Xmx1024M -Xms512M -cp "${PN}.jar" net.minecraft.LauncherFrame
EOF

	# Install icon and desktop file
	doicon "${PN}.png" || die "newicon \"${PN}.png\" failed"
	make_desktop_entry "${PN}" "${MY_PN}" || die "make_desktop_entry failed"

	prepgamesdirs
}
