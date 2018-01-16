# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Generates a template directory that you can use to build a custom epub"
HOMEPAGE="http://github.com/jlapier/text_to_epub"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/RedCloth-0"
ruby_add_rdepend ">=dev-ruby/liquid-0"
ruby_add_rdepend ">=dev-ruby/uuid-0"
ruby_add_rdepend ">=dev-ruby/linguistics-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.2.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.0.0"
ruby_add_rdepend ">=dev-ruby/jeweler-1.5.1"
ruby_add_rdepend ">=dev-ruby/rcov-0"
ruby_add_rdepend ">=dev-ruby/RedCloth-0"
ruby_add_rdepend ">=dev-ruby/liquid-0"
ruby_add_rdepend ">=dev-ruby/uuid-0"
ruby_add_rdepend ">=dev-ruby/linguistics-0"

