# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Adhearsion is an open-source telephony development framework"
HOMEPAGE="http://adhearsion.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.0.0"
ruby_add_rdepend ">=dev-ruby/adhearsion-loquacious-1.9"
ruby_add_rdepend ">=dev-ruby/bundler-1.0"
ruby_add_rdepend ">=dev-ruby/celluloid-0.14"
ruby_add_rdepend ">=dev-ruby/countdownlatch-0"
ruby_add_rdepend ">=dev-ruby/deep_merge-0"
ruby_add_rdepend ">=dev-ruby/ffi-1.0"
ruby_add_rdepend ">=dev-ruby/girl_friday-0"
ruby_add_rdepend ">=dev-ruby/has-guarded-handlers-1.6"
ruby_add_rdepend ">=dev-ruby/logging-1.8"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/punchblock-2.6"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/ruby_speech-2.0"
ruby_add_rdepend ">=dev-ruby/thor-0.18.0"
ruby_add_rdepend ">=dev-ruby/aruba-0.5"
ruby_add_rdepend ">=dev-ruby/ci_reporter_rspec-0"
ruby_add_rdepend ">=dev-ruby/ci_reporter_cucumber-0"
ruby_add_rdepend ">=dev-ruby/cucumber-0"
ruby_add_rdepend ">=dev-ruby/guard-cucumber-0"
ruby_add_rdepend ">=dev-ruby/guard-rspec-0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/simplecov-rcov-0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/guard-yard-0"
ruby_add_rdepend ">=dev-ruby/coveralls-0"
ruby_add_rdepend ">=dev-ruby/timecop-0"

