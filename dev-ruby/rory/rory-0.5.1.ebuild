# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="An exercise: Untangle the collusion of Rails idioms
from my Ruby knowledge, while trying to understand some
Rails design decisions"
HOMEPAGE="http://github.com/screamingmuse/rory"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-1.0"
ruby_add_rdepend ">=dev-ruby/sequel-4.0"
ruby_add_rdepend ">=dev-ruby/thin-1.0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-3"
ruby_add_rdepend ">=dev-ruby/capybara-0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/reek-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.0"

