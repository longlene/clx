# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    Reek is a tool that examines Ruby classes, modules and methods and reports
    any code smells it finds"
HOMEPAGE="https://github.com/troessner/reek/wiki"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/codeclimate-engine-rb-0.1.0"
ruby_add_rdepend ">=dev-ruby/parser-2.2"
ruby_add_rdepend ">=dev-ruby/private_attr-1.1"
ruby_add_rdepend ">=dev-ruby/rainbow-2.0"
ruby_add_rdepend ">=dev-ruby/unparser-0.2.2"
ruby_add_rdepend ">=dev-ruby/activesupport-4.2"
ruby_add_rdepend ">=dev-ruby/aruba-0.10.0"
ruby_add_rdepend ">=dev-ruby/ataru-0.2.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.1"
ruby_add_rdepend ">=dev-ruby/cucumber-2.0"
ruby_add_rdepend ">=dev-ruby/factory_girl-4.0"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/rubocop-0.34.0"

