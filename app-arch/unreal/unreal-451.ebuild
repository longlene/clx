# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

DESCRIPTION="Unreal - futuristic shooter (requires Unreal Tournament)"
HOMEPAGE="http://www.unreal.com/"
SRC_URI="http://dev.gentooexperimental.org/~chewi/distfiles/u1-on-ut-${PVR}.tar.bz2"

LICENSE="as-is"
SLOT="0"
KEYWORDS="-* amd64 ~x86"
IUSE="doc linguas_de linguas_es linguas_fr linguas_it"
RESTRICT="strip"

DEPEND=">=app-arch/unshield-0.5-r1
	dev-util/xdelta
	~games-fps/unreal-tournament-${PV}"

S=${WORKDIR}
dir=${GAMES_PREFIX_OPT}/${PN}
Ddir=${D}/${dir}

QA_TEXTRELS="${dir:1}/System/Engine.so"

UT_DIR=${GAMES_PREFIX_OPT}/unreal-tournament

set_dirs() {
	# The top-level directory names can change per CD.
	if [[ "${U_SOURCE}" == "anthology" ]] || [[ -e "${CDROM_ROOT}/System" ]] ; then
		HELP_DIR="Help"
		MANUAL_DIR="Manual"
		MUSIC_DIR="Music"
		SOUNDS_DIR="Sounds"
		SYSTEM_DIR="System"
		TEXTURES_DIR="Textures"
	else
		HELP_DIR="HELP"
		MANUAL_DIR="MANUAL"
		MUSIC_DIR="MUSIC"
		SOUNDS_DIR="SOUNDS"
		SYSTEM_DIR="SYSTEM"
		TEXTURES_DIR="TEXTURES"
	fi

	if [[ "${U_SOURCE}" == "anthology" ]] || [[ -e "${CDROM_ROOT}/Maps" ]] ; then
		MAPS_DIR="Maps"
	elif [[ -e "${CDROM_ROOT}/MAPS" ]] ; then
		MAPS_DIR="MAPS"
	else
		MAPS_DIR="maps"
	fi
}

src_unpack() {
	local lang lower x
	unpack ${A}
	mkdir Help Maps Music System

	SYSTEM={{Bot[Pp]ack,Editor,Ip{Drv,Server},UBrowser,UTServerAdmin,UWeb}.{int,u},{Core,Engine,Fire,Unreal{I,Share},UWindow}.u,{UTMenu,{Glide,Ip,OpenGl,SDLGL,SDLSoft}Drv}.int,{ALAudio,Audio,Core,Editor,Fire,libopenal-0.0,NullNetDriver,NullRender,Render,UWeb,{Glide,Ip,Null,OpenGL,SDL,SDLGL,SDLSoft}Drv}.so,OpenGlDrv.ini,libmikmod.so.2}
	LOCALIZED_SYSTEM={Botpack,Editor,GlideDrv,IpDrv,IpServer,OpenGlDrv,UBrowser,UTBrowser,UTMenu,UWindow}

	# Link some directories.
	ln -sfn "${UT_DIR}"/{Sounds,Textures,Web} . || die "ln Sounds Textures Web"

	# Link generic system files.
	eval ln -sfn "${UT_DIR}/System"/${SYSTEM} System || die "ln System"

	# Copy generic UMenu file.
	cp -f u1-on-ut-${PVR}/UMenu.int System || die "cp UMenu.int"

	for lang in es fr it ; do
		if use linguas_${lang} ; then
			# Link localized system files.
			eval ln -sfn "${UT_DIR}/System"/${LOCALIZED_SYSTEM}.${lang}t System || die "ln System (${lang}t)"

			# Copy localized UMenu file.
			cp -f u1-on-ut-${PVR}/UMenu.${lang}t System || die "cp UMenu.${lang}t"
		fi
	done

	# Copy and modify UnrealTournament.ini to fit Unreal.
	sed -r \
		-e "/^Class=/d" \
		-e "/^ServerPackages=/d" \
		-e "s/^LocalMap=.*$/LocalMap=Unreal.unr/" \
		-e "s/^AudioDevice=.*$/AudioDevice=ALAudio.ALAudioSubsystem/" \
		-e "s/^DefaultGame=.*$/DefaultGame=UnrealShare.SinglePlayer/" \
		-e "s/^DefaultServerGame=.*$/DefaultServerGame=UnrealShare.DeathMatchGame/" \
		-e "s/^LookAndFeelClass=.*$/LookAndFeelClass=UMenu.UMenuUGLookAndFeel/" \
		"${ROOT}${UT_DIR}/System/UnrealTournament.ini" > System/Unreal.ini || die "sed UnrealTournament.ini > Unreal.ini"

	# Copy and modify the startup script to fit Unreal.
	sed -r \
		-e "s/ut/unreal/g" \
		-e "s/unreal-tournament/unreal/g" \
		-e "s/Unreal Tournament/Unreal/g" \
		"${ROOT}${UT_DIR}/ut" > unreal || die "sed ut > unreal"

	# Patch ut-bin to use "Unreal" instead of "UnrealTournament" and ~/.loki/unreal instead of
	# ~/.loki/ut. Because "unreal" is a longer string than "ut", an unimportant warning message
	# about the preferences directory is broken. Nevermind!
	xdelta patch "u1-on-ut-${PVR}/unreal-bin-${PV}.xdp" "${ROOT}${UT_DIR}/System/ut-bin" System/unreal-bin || die "xdelta patch ut-bin > unreal-bin"

	# Patch Engine.so so that loading a saved game doesn't crash the game. The Linux version of UT
	# doesn't normally handle this properly but it can be worked around by loading the saved game as
	# if it were a map, since that is essentially what it is anyway.
	xdelta patch "u1-on-ut-${PVR}/Engine.so-${PV}.xdp" "${ROOT}${UT_DIR}/System/Engine.so" System/Engine.so || die "xdelta patch Engine.so"

	# Patch UTMenu.u to allow the game to be played in languages other than English. Only one line
	# of UnrealScript is commented and it is unclear why this is necessary but not doing so prevents
	# the game from starting. It complains about not being able to find UTMenu.LadrArrow. This patch
	# also stops music from automatically playing in the menu.
	xdelta patch "u1-on-ut-${PVR}/UTMenu.u-${PV}.xdp" "${ROOT}${UT_DIR}/System/UTMenu.u" System/UTMenu.u || die "xdelta patch UTMenu.u"

	# Patch UMenu.u to provide the "Unreal Gold" look and feel and allow the new game menu to be
	# configured using the UMenu localization files.
	case `md5sum "${ROOT}${UT_DIR}/System/UMenu.u" | head -c32` in
		"162229f20b42bd85170f014023162917")	einfo "UT version 436 UMenu.u detected"
							xdelta patch "u1-on-ut-${PVR}/UMenu.u-436.xdp" "${ROOT}${UT_DIR}/System/UMenu.u" System/UMenu.u || die "xdelta patch UMenu.u" ;;
		"d0c58a8a5cd6f19cb170b28fd9fa6ddd")	einfo "Unreal Anthology UMenu.u detected"
							xdelta patch "u1-on-ut-${PVR}/UMenu.u-anthology.xdp" "${ROOT}${UT_DIR}/System/UMenu.u" System/UMenu.u || die "xdelta patch UMenu.u" ;;
		"bbec875a92f258bf01f07638fe29baff")	einfo "UT \"Best of Infogrames\" UMenu.u detected"
							xdelta patch "u1-on-ut-${PVR}/UMenu.u-infogrames.xdp" "${ROOT}${UT_DIR}/System/UMenu.u" "${T}/UMenu.u" || die "xdelta patch UMenu.u"
							xdelta patch "u1-on-ut-${PVR}/UMenu.u-anthology.xdp" "${T}/UMenu.u" System/UMenu.u || die "xdelta patch UMenu.u"
							rm -f "${T}/UMenu.u" ;;
		*)					ewarn "Unsupported UMenu.u detected"
							ewarn "Continuing anyway but the game is unlikely to work!"
							cp "${ROOT}${UT_DIR}/System/UMenu.u" System/UMenu.u || die "cp UMenu.u" ;;
	esac

	# Set the starting map to Vortex2 in all UMenu localization files.
	sed -r -i "s/^StartMap=.*$/StartMap=Vortex2.unr/" System/UMenu.??? || die "sed UMenu.???"

	CDROM_NAME="Unreal CD, Unreal Gold CD or Unreal Anthology DVD"
	cdrom_get_cds TEXTURES/UGoldCredits.utx:Maps/Vortex2.unr:AutoRunData/Unreal.ico

	case ${CDROM_SET} in
		0)	U_SOURCE="gold"
			einfo 'Found Unreal Gold CD' ;;
		1)	U_SOURCE="original"
			einfo 'Found Unreal CD or previous installation' ;;
		2)	U_SOURCE="anthology"
			einfo 'Found Unreal Anthology DVD' ;;
	esac

	set_dirs

	HELP=ReadMe.htm
	MAPS={Bluff,Ceremony,Chizra,Dark,DasaCellars,DasaPass,DCrater,Dig,DKNightOp,D[Mm]{Ariza,Curse,DeathFan,Deck16,Elsinore,[Ff]ith,HealPod,Morbias,Radikus,Tundra},Dug,[Ee]ndgame,Entry,Extreme{Beg,Core,Dark,DGen,End,Gen,Lab},Gateway,Harobed,Isv{Deck1,Kran32,Kran4},Nali{Boat,C,Lord},Noork,NyLeve,Passage,QueenEnd,Ruins,Sky{Base,Caves,Town},SpireVillage,TerraLift,Terraniux,TheSunspire,Trench,Unreal,VeloraEnd,Vortex2}.unr
	MUSIC={Chizra1,Crater,DigSh,Dusk,EndEx,EverSmoke,Fifth,Fly[Bb]y,Fourth,Guardian,Hub2,Isotoxin,Kran2,Kran32,K_vision,Nali,Newmca{13,16,7,9},Opal,QueenSong,Seti,SkyTwn,Spire,Surface,Unreal4,UTemple,utend,Vortex,WarGate,Warlord}.umx
	SYSTEM={{Core,Engine,Unreal{,I,Share},Window,{Female{1,2},Male{1,2,3},SkTrooper}Skins}.int,User.ini}
	LOCALIZED_SYSTEM={Bluff,Ceremony,Chizra,Core,Dark,Dasa{Cellars,Pass},DCrater,Dig,Dug,Engine,Extreme{Beg,Core,Dark,DGen,End,Gen,Lab},Harobed,IsvDeck1,IsvKran32,IsvKran4,NaliC,Noork,Nyleve,Passage,Ruins,Sky{Base,Caves,Town},SpireVillage,Terra{Lift,niux},TheSunspire,Trench,Unreal{,I,Share},Window,Vortex2}

	if [[ "${U_SOURCE}" == "anthology" ]] ; then
		# Symlinks for unshield.
		ln -sfn "${CDROM_ROOT}"/Disk1/data1.hdr "${T}"
		ln -sfn "${CDROM_ROOT}"/Disk*/data*.cab "${T}"

		CAB_GROUPS="Help Maps Music System_All System_English"

		# The manual is pretty heavy at 10MB!
		use doc && CAB_GROUPS="${CAB_GROUPS} Manual_English"

		# Add requested language components. The manuals are all in English!?
		use linguas_de && CAB_GROUPS="${CAB_GROUPS} System_German"
		use linguas_es && CAB_GROUPS="${CAB_GROUPS} System_Spanish"
		use linguas_fr && CAB_GROUPS="${CAB_GROUPS} System_French"
		use linguas_it && CAB_GROUPS="${CAB_GROUPS} System_Italian"

		# Unpack!
		for x in ${CAB_GROUPS} ; do
			unshield -g 1_UnrealGold_${x} x "${T}"/data1.cab || die "unshield x"
		done

		# Retrieve the manual.
		if use doc ; then
			mv 1_UnrealGold_Manual_English/Manual.pdf manual_en.pdf || die "mv manual_en.pdf"
		fi

		eval mv -f 1_UnrealGold_Help/${HELP} Help || die "mv Help"
		eval mv -f 1_UnrealGold_Maps/${MAPS} Maps || die "mv Maps"
		eval mv -f 1_UnrealGold_Music/${MUSIC} Music || die "mv Music"

		eval mv -f 1_UnrealGold_System_{All,English}/${SYSTEM} System 2> /dev/null
		eval mv -f 1_UnrealGold_System_*/${LOCALIZED_SYSTEM}.{det,est,frt,itt} System 2> /dev/null

		rm -rf 1_UnrealGold_*
	else
		eval cp -f "\"${CDROM_ROOT}/${HELP_DIR}\""/${HELP} Help || die "cp Help"
		eval cp -f "\"${CDROM_ROOT}/${MAPS_DIR}\""/${MAPS} Maps || die "cp Maps"
		eval cp -f "\"${CDROM_ROOT}/${MUSIC_DIR}\""/${MUSIC} Music || die "cp Music"
		eval cp -f "\"${CDROM_ROOT}/${SYSTEM_DIR}\""/${SYSTEM} System || die "cp System"

		# Retrieve the manual if it exists. It's not present on all CDs.
		if use doc ; then
			if [[ -e "${CDROM_ROOT}/${MANUAL_DIR}/Unreal ENG manual.pdf" ]] ; then
				cp -f "${CDROM_ROOT}/${MANUAL_DIR}/Unreal ENG manual.pdf" manual_en.pdf || die "cp manual_en.pdf"
			elif [[ -f "${ROOT}/usr/share/doc/${PF}/manual_en.pdf" ]] ; then
				cp -f "${ROOT}/usr/share/doc/${PF}/manual_en.pdf" . || die "cp manual_en.pdf"
			fi
		fi

		# Copy localized system files.
		for lang in de es fr it ; do
			if use linguas_${lang} ; then
				eval cp -f "\"${CDROM_ROOT}/${SYSTEM_DIR}\""/${LOCALIZED_SYSTEM}.${lang}t System \
					|| die "cp System (${lang}t) - Maybe your CD doesn't include the ${lang} language files."
			fi
		done
	fi

	for lang in de es fr it ; do
		if use linguas_${lang} ; then
			# Symlink localized system files to all necessary case combinations. *groan!*
			for x in `echo {Bluff,Ceremony,Chizra,Dasa{Cellars,Pass},Extreme{Beg,Core,Dark,DGen,End,Gen,Lab},IsvKran4,Nyleve,Passage,SpireVillage,Terraniux}` ; do
				lower=`echo ${x} | tr A-Z a-z` || die "tr ${x}"
				ln -sfn ${x}.${lang}t System/${lower}.${lang}t || die "ln ${x}.${lang}t ${lower}.${lang}t"
			done

			for x in dark daRk DarK DArk ; do
				ln -sfn Dark.${lang}t System/${x}.${lang}t || die "ln Dark.${lang}t ${x}.${lang}t"
			done

			for x in dig diG dIg dIG DiG DIg DIG ; do
				ln -sfn Dig.${lang}t System/${x}.${lang}t || die "ln Dig.${lang}t ${x}.${lang}t"
			done

			for x in dug duG dUg dUG DuG DUg DUG ; do
				ln -sfn Dug.${lang}t System/${x}.${lang}t || die "ln Dug.${lang}t ${x}.${lang}t"
			done

			for x in isvdeck1 ISVDECK1 ; do
				ln -sfn IsvDeck1.${lang}t System/${x}.${lang}t || die "ln IsvDeck1.${lang}t ${x}.${lang}t"
			done

			for x in Nalic NALIC ; do
				ln -sfn NaliC.${lang}t System/${x}.${lang}t || die "ln NaliC.${lang}t ${x}.${lang}t"
			done

			for x in ruins RUINS ; do
				ln -sfn Ruins.${lang}t System/${x}.${lang}t || die "ln Ruins.${lang}t ${x}.${lang}t"
			done

			ln -sfn IsvKran32.${lang}t System/ISVKRAN32.${lang}t || die "ln IsvKran32.${lang}t ISVKRAN32.${lang}t"
			ln -sfn SkyCaves.${lang}t System/Skycaves.${lang}t || die "ln SkyCaves.${lang}t Skycaves.${lang}t"
			ln -sfn TheSunspire.${lang}t System/Thesunspire.${lang}t || die "ln TheSunspire.${lang}t Thesunspire.${lang}t"
		fi
	done

	# D[Mm] => DM-
	cd Maps
	for x in D[Mm]*.unr ; do
		ln -sfn ${x} ${x/D[Mm]/DM-} || die "ln ${x} ${x/D[Mm]/DM-}"
	done
	cd ..

	# We need to change this if installing from Unreal Gold/Anthology. Do it anyway, just in case.
	sed -i -r "s/^Class=.*$/Class=UnrealI.FemaleOne/" System/User.ini || die "sed User.ini"

	# Fix server vulnerability - part of bug #44351.
	for lang in in de es fr it ; do
		if [[ -e "System/Core.${lang}t" ]] ; then
			sed -i "/^LoadClassMismatch=/s:%s.%s:%s:" "System/Core.${lang}t" || die "sed Core.${lang}t"
		fi
	done
}

src_install() {
	local x

	# Guard against executable flag potentially set.
	for x in `find -type f` ; do
		chmod 640 "${x}" || die "chmod noexec"
	done

	# System files.
	#chmod 750 System/unreal-bin System/*.so System/*.so.* || die "chmod exec"
	for x in `find -P System/ -type f \( -name "unreal-bin" -o -name "*.so" -o -name "*.so.*" \)` ; do
		chmod 750 "${x}" || die "chmod exec"
	done

	# Move instead of copy to reduce disk stress. (-:
	# Permissions are corrected with prepgamesdirs below.
	dodir "${dir}"
	mv Help Maps Music Sounds System Textures Web "${Ddir}" || die "mv directories"

	# Script.
	exeinto "${dir}"
	doexe unreal || die "doexe unreal"

	# Icon.
	insinto "${dir}"
	doins "u1-on-ut-${PVR}/icon.xpm" || die "doins icon"

	# Desktop.
	games_make_wrapper unreal ./unreal "${dir}"
	newicon "u1-on-ut-${PVR}/icon.xpm" unreal.xpm || die "newicon"
	make_desktop_entry unreal "Unreal" unreal.xpm

	# Manual.
	insinto /usr/share/doc/${PF}
	if [[ -f "manual_en.pdf" ]] ; then
		doins manual_en.pdf || die "doins manual_en.pdf"
	fi

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst

	elog "Unreal was never released for Linux. This is an unsupported hack that runs"
	elog "on top of Unreal Tournament. These are the known issues."
	elog ""
	elog " - Menu style: The old Unreal-style menu can be used but certain things"
	elog "   such as the control configuration do not work, hence we use the newer"
	elog "   UT-style menu instead."
	elog ""
	elog " - Credits: The credits option in the Help menu does not work because"
	elog "   the necessary files were not included with the original release."
	elog ""
	elog " - Audio driver: The OpenAL driver (ALAudio.ALAudioSubsystem) has been"
	elog "   chosen regardless of which driver you use for UT. This is because the"
	elog "   music sometimes fails to change and some maps fail to load at all when"
	elog "   using the generic audio driver (Audio.GenericAudioSubsystem)."
	elog ""
	elog " - Bots: The bots do not work at all. Play UT instead."
	elog ""
	elog " - Multiplayer: This hack is not at all compatible with the official"
	elog "   versions of Unreal. However, it should be compatible with itself."
	echo

	if use linguas_de || use linguas_es || use linguas_fr || use linguas_it ; then
		elog "You have installed support for one or more additional languages. The game"
		elog "defaults to English but you can change the language by running the game"
		elog "once and then editing ~/.loki/unreal/System/Unreal.ini. Change the"
		elog "Language entry under [Engine.Engine] to 'det', 'est', 'frt' or 'itt'"
		elog "for German, Spanish, French or Italian respectively."
		echo
	fi

	if use linguas_de ; then
		elog "Unreal was translated to German but Unreal Tournament wasn't so some"
		elog "text may appear in English even if you configure the game for German."
		echo
	fi

	if [ "${U_SOURCE}" == "gold" -o "${U_SOURCE}" == "anthology" ]; then
		elog "The Return to Na Pali mission pack can be installed from your Unreal CD"
		elog "using the separate games-fps/unreal-returntonapali ebuild."
		echo
	fi
}
