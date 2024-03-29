# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="RTMP support for EventMachine"
HOMEPAGE="http://github.com/jcoene/em-rtmp"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/eventmachine-0"
ruby_add_rdepend ">=dev-ruby/rocketamf_pure-1.0.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.8.0"
ruby_add_rdepend ">=dev-ruby/guard-rspec-0"
ruby_add_rdepend ">=dev-ruby/growl-0"

