# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Irbtools make Ruby's IRB more productive"
HOMEPAGE="https://github.com/janlelis/irbtools"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rspec-3.2"
ruby_add_rdepend ">=dev-ruby/rake-10.4"
ruby_add_rdepend ">=dev-ruby/every_day_irb-2.0"
ruby_add_rdepend ">=dev-ruby/fancy_irb-1.0"
ruby_add_rdepend ">=dev-ruby/wirb-2.0"
ruby_add_rdepend ">=dev-ruby/hirb-0.7"
ruby_add_rdepend ">=dev-ruby/binding_repl-3.0"
ruby_add_rdepend ">=dev-ruby/paint-0.9"
ruby_add_rdepend ">=dev-ruby/clipboard-1.0"
ruby_add_rdepend ">=dev-ruby/interactive_editor-0.0"
ruby_add_rdepend ">=dev-ruby/coderay-1.1"
ruby_add_rdepend ">=dev-ruby/debugging-1.1"
ruby_add_rdepend ">=dev-ruby/code-0.9"
ruby_add_rdepend ">=dev-ruby/ori-0.1.0"
ruby_add_rdepend ">=dev-ruby/methodfinder-2.0"
ruby_add_rdepend ">=dev-ruby/method_locator-0.0"
ruby_add_rdepend ">=dev-ruby/ruby_version-1.0"
ruby_add_rdepend ">=dev-ruby/ruby_engine-1.0"
ruby_add_rdepend ">=dev-ruby/ruby_info-1.0"
ruby_add_rdepend ">=dev-ruby/os-0.9"
ruby_add_rdepend ">=dev-ruby/instance-0.2"

