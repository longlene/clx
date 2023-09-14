# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Shortener is a Rails Engine Gem that makes it easy to create and interpret shortened URLs on your own domain from within your Rails application"
HOMEPAGE="http://jamespmcgrath.com/projects/shortener"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rails-3.0.7"
ruby_add_rdepend ">=dev-ruby/voight_kampff-1.0.2"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/rspec-rails-3.3.0"
ruby_add_rdepend ">=dev-ruby/shoulda-matchers-3"
ruby_add_rdepend ">=dev-ruby/faker-0"
ruby_add_rdepend ">=dev-ruby/byebug-0"

