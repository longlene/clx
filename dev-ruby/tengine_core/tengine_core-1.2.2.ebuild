# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="tengine_core is a framework/engine to support distributed processing"
HOMEPAGE="https://github.com/tengine/tengine/tree/develop/tengine_core"

LICENSE="MPL2.0/LGPLv3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.1.0"
ruby_add_rdepend ">=dev-ruby/activemodel-3.1.0"
ruby_add_rdepend ">=dev-ruby/selectable_attr-0.3.15"
ruby_add_rdepend ">=dev-ruby/mongoid-3.0.22"
ruby_add_rdepend ">=dev-ruby/tengine_support-1.2.2"
ruby_add_rdepend ">=dev-ruby/tengine_event-1.2.2"
ruby_add_rdepend ">=dev-ruby/daemons-1.1.4"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.10.0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/autotest-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/pry-doc-0"
ruby_add_rdepend ">=dev-ruby/pry-debugger-0"
ruby_add_rdepend ">=dev-ruby/ZenTest-4.9.0"
ruby_add_rdepend ">=dev-ruby/factory_girl-3.3.0"

