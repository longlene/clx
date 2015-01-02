# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="irbtools makes using Ruby's IRB easier and more fun"
HOMEPAGE="https://github.com/janlelis/irbtools"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/every_day_irb-1.7.0"
ruby_add_rdepend ">=dev-ruby/binding_repl-1"
ruby_add_rdepend ">=dev-ruby/boson-1.3.0"
ruby_add_rdepend ">=dev-ruby/boson-more-0.3.0"
ruby_add_rdepend ">=dev-ruby/alias-0.2.3"
ruby_add_rdepend ">=dev-ruby/clipboard-1.0.5"
ruby_add_rdepend ">=dev-ruby/interactive_editor-0.0.10"
ruby_add_rdepend ">=dev-ruby/fancy_irb-0.7.3"
ruby_add_rdepend ">=dev-ruby/wirb-1.0.3"
ruby_add_rdepend ">=dev-ruby/paint-0.8.7"
ruby_add_rdepend ">=dev-ruby/hirb-0.7"
ruby_add_rdepend ">=dev-ruby/coderay-1.1.0"
ruby_add_rdepend ">=dev-ruby/debugging-1.0"
ruby_add_rdepend ">=dev-ruby/g-1.7.2"
ruby_add_rdepend ">=dev-ruby/ori-0.1.0"
ruby_add_rdepend ">=dev-ruby/methodfinder-1.2.5"
ruby_add_rdepend ">=dev-ruby/method_locator-0.0.4"
ruby_add_rdepend ">=dev-ruby/method_source-0.8.2"
ruby_add_rdepend ">=dev-ruby/ruby_version-1.0"
ruby_add_rdepend ">=dev-ruby/ruby_engine-1.0"
ruby_add_rdepend ">=dev-ruby/ruby_info-1.0"
ruby_add_rdepend ">=dev-ruby/os-0.9"

