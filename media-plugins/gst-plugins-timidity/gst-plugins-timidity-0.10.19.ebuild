# Copyright Raffaello D. Di Napoli <fastijum@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit gst-plugins-bad

DESCRIPTION="GStreamer plugin for Timidity++ MIDI sequencer"
KEYWORDS="x86"
IUSE=""

RDEPEND="media-libs/libtimidity
	media-sound/timidity++"

DEPEND="${RDEPEND}"
