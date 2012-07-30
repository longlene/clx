# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils rpm
# mozextension is broken, truely broken. Look at lightning ebuild to get the
# correct version

DESCRIPTION="Google Desktop"
HOMEPAGE="http://desktop.google.com/linux/"
SRC_URI="x86? ( http://dl.google.com/linux/rpm/stable/i386/google-desktop-linux-current.rpm )
		amd64? ( http://dl.google.com/linux/rpm/stable/x86_64/google-desktop-linux-current.rpm )"

LICENSE="as-is"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="firefox thunderbird msoffice"

RDEPEND="virtual/libc
	x11-libs/libX11
	x11-libs/libXi
	msoffice? ( app-text/catdoc app-text/wv )
	dev-libs/atk
	dev-libs/glib
	x11-libs/gtk+
	x11-libs/pango"
DEPEND="${RDEPEND}"

ENVDDIR="/etc/env.d/"
ENVDFILE="45google-desktop"

S="${WORKDIR}"

#RESTRICT="fetch strip"
#pkg_nofetch() {
#	einfo "Please download ${A} yourself from http://desktop.google.com/linux"
#	einfo "and place it in ${DISTDIR}"
#	einfo "Please ensure that you download the correct file corresponding to"
#	einfo "your arch"
#}

src_unpack() {
	rpm_src_unpack || die "Unpack failed"

	# Patch the Categories properly
	cd $S/opt/google/desktop/xdg
	sed -i -e '/^Categories=/s/$/;/' *.desktop
}

src_compile() {
	:
}

src_install() {

	# This is a workaround for the buggy xpi_install from mozextension
	# Usage mozi_xpi <from_unpacked_dir> <to_mozilla_dir>
	function mozi_xpi() {
		local from_dir="$1" to_dir="$2"
		
		cd "$from_dir"
		emid="$(sed -n -e '/<\?em:id>\?/!d; s/.*\([\"{].*[}\"]\).*/\1/; s/\"//g; p;' \
			install.rdf | sed -e '1d')"
		einfo "DEBUG: Generated $emid for ${from_dir##*\/}"
		test -z "${emid}" && die "Generating extension id failed"

		dodir "$to_dir/extensions/${emid}"
		insinto "$to_dir/extensions/${emid}"
		doins "$from_dir"/*

		dodir "$to_dir"/{chrome,extensions}.d
		echo "extension,${emid}" > "$D/$to_dir/extensions.d/$PN"
	}


	# Define some variables to shorten commands
	local google_d=/opt/google/desktop
	local target_bin=$google_d/bin
	local target_lib=$google_d/lib

	# do not include gdl-update since its RH specific
	#dodir /etc/cron.hourly
	#insinto /etc/cron.hourly
	#doins etc/cron.hourly/gdl-update

	dodir /opt/google

	insinto $google_d
	doins	${S}$google_d/*
	doins	${S}$google_d/.gdl_installed_files

	exeinto $target_bin
	doexe	${S}/$target_bin/gdl*
	doexe	${S}/$target_bin/extract_msoffice_content.sh
	doexe	${S}/$target_bin/xdg-open

	insinto $google_d/resource
	doins	${S}/$google_d/resource/*

	insinto $google_d/xdg
	doins	${S}/$google_d/xdg/*

	dosym	$target_bin/gdlinux /opt/bin/gdlinux
	
	into /opt/google/desktop
	insinto $google_d
	dolib.so ${S}/$google_d/lib/*
	# Apparently, since I don't define ABI, everything is put into
	# ${target_lib}64. We can get around this by doing the dolib.so stuff
	# ourselves, or by defining ABI=x86 which will screw up other stuff such as
	# firefox and thunderbird plugins. The least troublesome method is to just
	# create a softlink ;)
	use amd64 && dosym ${target_lib}64 $target_lib

	dodir	/var/cache/google/desktop
	keepdir /var/cache/google/desktop

	fperms 755 /var/cache/google
	fperms 777 /var/cache/google/desktop
	fperms o+t /var/cache/google/desktop

	cd ${S}/$google_d/xdg
	insinto /usr/share/desktop-directories
	doins	google-gdl.directory
	domenu	google-gdl.desktop google-gdl-preferences.desktop

	# Install Extensions
	if use firefox; then
		has_version '>=www-client/mozilla-firefox-1.5' && \
			mozi_xpi ${S}/$google_d/plugin/firefox \
			"/usr/$(get_libdir)/mozilla-firefox"
		has_version '>=www-client/mozilla-firefox-bin-1.5' && \
			mozi_xpi ${S}/$google_d/plugin/firefox "/opt/firefox"
	fi
	if use thunderbird; then
		has_version '>=mail-client/mozilla-thunderbird-1.5' && \
			mozi_xpi ${S}/$google_d/plugin/thunderbird \
			"/usr/$(get_libdir)/mozilla-thunderbird"
		has_version '>=mail-client/mozilla-thunderbird-bin-1.5' && \
			mozi_xpi ${S}/$google_d/plugin/thunderbird "/opt/thunderbird"
	fi

	# Update env.d
	dodir /etc/env.d
	echo "LDPATH=$target_lib" > ${D}${ENVDDIR}${ENVDFILE}
}

pkg_postinst ()
{
	env-update
	source /etc/profile
}
