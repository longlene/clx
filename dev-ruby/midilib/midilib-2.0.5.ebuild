# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="midilib is a pure Ruby MIDI library useful for reading and
writing standard MIDI files and manipulating MIDI event data"
HOMEPAGE="http://github.com/jimm/midilib"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""


