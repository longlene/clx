# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Rocket Pants adds JSON API love to Rails and ActionController, making it simpler to build API-oriented controllers"
HOMEPAGE="http://github.com/Sutto/rocket_pants"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/actionpack-3.0"
ruby_add_rdepend ">=dev-ruby/railties-3.0"
ruby_add_rdepend ">=dev-ruby/will_paginate-3.0"
ruby_add_rdepend ">=dev-ruby/hashie-1.0"
ruby_add_rdepend ">=dev-ruby/api_smith-0"
ruby_add_rdepend ">=dev-ruby/moneta-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.4"
ruby_add_rdepend ">=dev-ruby/rspec-rails-2.4"
ruby_add_rdepend ">=dev-ruby/rr-1.0"
ruby_add_rdepend ">=dev-ruby/webmock-0"
ruby_add_rdepend ">=dev-ruby/activerecord-3.0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/reversible_data-1.0"
ruby_add_rdepend ">=dev-ruby/kaminari-0"

