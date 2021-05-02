# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Like Rack is to Rails and Sinatra, Punchblock provides a consistent API on top of several underlying third-party call control protocols"
HOMEPAGE="http://github.com/adhearsion/punchblock"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nokogiri-1.5"
ruby_add_rdepend ">=dev-ruby/blather-1.0"
ruby_add_rdepend ">=dev-ruby/activesupport-3.0.0"
ruby_add_rdepend ">=dev-ruby/state_machine-1.0"
ruby_add_rdepend ">=dev-ruby/future-resource-1.0"
ruby_add_rdepend ">=dev-ruby/has-guarded-handlers-1.5"
ruby_add_rdepend ">=dev-ruby/celluloid-0.15.2"
ruby_add_rdepend ">=dev-ruby/ruby_ami-2.2"
ruby_add_rdepend ">=dev-ruby/ruby_fs-1.1"
ruby_add_rdepend ">=dev-ruby/ruby_speech-2.3"
ruby_add_rdepend ">=dev-ruby/virtus-1.0"
ruby_add_rdepend ">=dev-ruby/ruby_jid-1.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.13"
ruby_add_rdepend ">=dev-ruby/ci_reporter-1.6"
ruby_add_rdepend ">=dev-ruby/yard-0.6"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/i18n-0"
ruby_add_rdepend ">=dev-ruby/countdownlatch-0"
ruby_add_rdepend ">=dev-ruby/guard-rspec-0"
ruby_add_rdepend ">=dev-ruby/rb-fsevent-0.9"
ruby_add_rdepend ">=dev-ruby/coveralls-0"
ruby_add_rdepend ">=dev-ruby/guard-rake-0"
ruby_add_rdepend ">=dev-ruby/benchmark_suite-0"

