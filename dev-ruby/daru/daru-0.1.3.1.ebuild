# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Daru (Data Analysis in RUby) is a library for analysis, manipulation and visualization
of data"
HOMEPAGE="http://github.com/v0dro/daru"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/reportbuilder-1.4"
ruby_add_rdepend ">=dev-ruby/spreadsheet-1.1.1"
ruby_add_rdepend ">=dev-ruby/bundler-1.10"
ruby_add_rdepend ">=dev-ruby/rake-10.5"
ruby_add_rdepend ">=dev-ruby/pry-0.10"
ruby_add_rdepend ">=dev-ruby/pry-byebug-0"
ruby_add_rdepend ">=dev-ruby/rserve-client-0.3"
ruby_add_rdepend ">=dev-ruby/rspec-3.4"
ruby_add_rdepend ">=dev-ruby/awesome_print-0"
ruby_add_rdepend ">=dev-ruby/nyaplot-0.1.5"
ruby_add_rdepend ">=dev-ruby/nmatrix-0.2.1"
ruby_add_rdepend ">=dev-ruby/distribution-0.7"
ruby_add_rdepend ">=dev-ruby/rb-gsl-1.16"
ruby_add_rdepend ">=dev-ruby/dbd-sqlite3-0"
ruby_add_rdepend ">=dev-ruby/dbi-0"
ruby_add_rdepend ">=dev-ruby/activerecord-4.0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/rubocop-0.40.0"

