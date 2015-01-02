# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Guard::Spork automatically manage Spork DRb servers"
HOMEPAGE="http://rubygems.org/gems/guard-spork"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/guard-2.0"
ruby_add_rdepend ">=dev-ruby/spork-0.8.4"
ruby_add_rdepend ">=dev-ruby/childprocess-0.2.3"
ruby_add_rdepend ">=dev-ruby/bundler-1.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.10"
ruby_add_rdepend ">=dev-ruby/guard-rspec-1.0"
ruby_add_rdepend ">=dev-ruby/pry-0.9.12.6"

