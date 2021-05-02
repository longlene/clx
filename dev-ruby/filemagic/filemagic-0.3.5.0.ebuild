# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Description of Filemagic"
HOMEPAGE="http://flama.me"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rails-4.2.0"
ruby_add_rdepend ">=dev-ruby/refile-0.6.1"
ruby_add_rdepend ">=dev-ruby/refile-mini_magick-0.2.0"
ruby_add_rdepend ">=dev-ruby/refile-s3-0.2.0"
ruby_add_rdepend ">=dev-ruby/sprockets-3.4"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/sprockets-es6-0.8.0"
ruby_add_rdepend ">=dev-ruby/jquery-rails-4.1"
ruby_add_rdepend ">=dev-ruby/sass-rails-5.0"

