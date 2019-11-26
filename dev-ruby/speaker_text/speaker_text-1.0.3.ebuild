# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A gem to automate transcription of audio and video media using the SpeakerText"
HOMEPAGE="http://github.com/thritysixthspan/speakertext"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/uuidtools-2.1.2"
ruby_add_rdepend ">=dev-ruby/httparty-0.8.1"

