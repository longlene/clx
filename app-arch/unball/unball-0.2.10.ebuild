
DESCRIPTION="The only extraction wrapper you should ever need"
HOMEPAGE="http://www.ssokolow.com/MyPrograms/Gentoo"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~mips ~ppc ~ppc64 ~sparc x86"
IUSE="usedeps"

# Note: In some cases, app-arch/macutil will suffice in place of app-arch/stuffit, but not all.
# Note: app-arch/sharutils, app-arch/macutil, and media-video/mkvtoolnix could replace uudeview if there were
#	also an xxdecode command in the Portage tree.
# TODO: Add support for app-arch/unmakeself
# Note: app-arch/arj is GPLed while app-arch/unarj is freeware, older, and lacking features.

RDEPEND="app-shells/bash
	usedeps? (
		app-arch/alien
		app-arch/arc
		app-arch/arj
		app-arch/bzip2
		app-arch/cabextract
		app-arch/cpio
		app-arch/gzip
		app-arch/lha
		app-arch/lzop
		app-arch/mscompress
		|| ( app-arch/rpm2cpio app-arch/rpm2targz )
		app-arch/rzip
		app-arch/stuffit
		app-arch/tar
		|| ( app-arch/unace app-arch/unace-bin )
		app-arch/unadf
		|| ( app-arch/undms app-arch/xdms )
		app-arch/unlzx
		|| ( app-arch/unrar app-arch/unrar-gpl app-arch/rar )
		app-arch/unshield
		app-arch/unzip
		app-arch/xar
		app-arch/zoo
		net-news/uudeview
		|| ( net-news/yencode net-news/yydecode )
	)"

DEPEND="${RDEPEND}
        sys-apps/help2man"

src_install() { 
	DESTDIR="${D}" ./install.sh;

	(use usedeps && has_version >=app-arch/unace-bin-2.0) || ewarn "WARNING: Your system lacks a version of unace capable of extracting ACE 2.x archives. Please see bug #102347."
	(use usedeps && (has_version >=app-arch/unrar-3.0 || has_version >=app-arch/rar-3.0)) || ewarn "WARNING: Your system lacks a RAR extractor capable of extracting RAR 3.x archives. You may want to emerge app-arch/unrar."
	which sfarkxtc > /dev/null || ewarn "Your system lacks sfarkxtc but unball requires it for unpacking SFArk-compressed SoundFonts."
	which FOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO > /dev/null || ewarn "Your system lacks paq6 but unball requires it for unpacking PAQ6 archives."
}

src_test()    { ./run_test.py; }
