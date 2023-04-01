# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A full stack web framework that maximises programmer happiness and productivity"
HOMEPAGE="http://github.com/slickgems/slick/slick"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/rack-1"
ruby_add_rdepend ">=dev-ruby/ripl-0"
ruby_add_rdepend ">=dev-ruby/ripl-multi_line-0"
ruby_add_rdepend ">=dev-ruby/json-1"
ruby_add_rdepend ">=dev-ruby/colored-1"
ruby_add_rdepend ">=dev-ruby/htmlentities-4"
ruby_add_rdepend ">=dev-ruby/mysql2-0"
ruby_add_rdepend ">=dev-ruby/sass-3"
ruby_add_rdepend ">=dev-ruby/minitest-5"

