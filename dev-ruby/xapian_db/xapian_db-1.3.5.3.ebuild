# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="XapianDb is a ruby gem that combines features of nosql databases and fulltext indexing"
HOMEPAGE="https://github.com/garaio/xapian_db"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/daemons-1.0.10"
ruby_add_rdepend ">=dev-ruby/guard-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.3.1"
ruby_add_rdepend ">=dev-ruby/simplecov-0.3.7"
ruby_add_rdepend ">=dev-ruby/beanstalk-client-1.1.0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/ruby-progressbar-0"
ruby_add_rdepend ">=dev-ruby/resque-1.19.0"
ruby_add_rdepend ">=dev-ruby/sidekiq-2.13.0"
ruby_add_rdepend "=dev-ruby/xapian-ruby-1.2.15.1"
ruby_add_rdepend ">=dev-ruby/pry-rails-0"

