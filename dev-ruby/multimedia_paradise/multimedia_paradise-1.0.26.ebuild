# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="
    This library is called multimedia_paradise"
HOMEPAGE="http://rubygems.org/gems/multimedia_paradise"

LICENSE="GPL 2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/opn-0"
ruby_add_rdepend ">=dev-ruby/colours-0"
ruby_add_rdepend ">=dev-ruby/cliner-0"
ruby_add_rdepend ">=dev-ruby/hours_to_seconds-0"
ruby_add_rdepend ">=dev-ruby/save_file-0"
ruby_add_rdepend ">=dev-ruby/esystem-0"
ruby_add_rdepend ">=dev-ruby/verbose_truth-0"
ruby_add_rdepend ">=dev-ruby/extract_audio-0"
ruby_add_rdepend ">=dev-ruby/file_duration-0"
ruby_add_rdepend ">=dev-ruby/capture_screen-0"

